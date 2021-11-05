*** SETTINGS ***
Library    DateTime
# Library    FakerLibrary
Library    OperatingSystem
Library    String
Library    SeleniumLibrary    timeout=30    implicit_wait=5
# Library    ExtendedSeleniumLibrary    timeout=30    implicit_wait=5
Library    Collections
Library     SeleniumLibrary    run_on_failure=SeleniumLibrary.CapturePageScreenshot

*** Variables ***
# page titles for logged in and not logged in users
${iprice_homepage_title}    iprice

*** Keywords ***
# Removes the chrome bar at the top which says "Chrome browser controlled by automation software"
Launch Chrome Browser Without Bar
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
    ${prefs}    Create Dictionary   credentials_enable_service=${false}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${options}    add_argument    disable-infobars
    Create WebDriver    Chrome    chrome_options=${options}
#    Open Browser    Chrome    chrome_options=${options}

# Launch Browser based on the Browser type passed as argument. Support for chrome only atm
Launch Browser
    [Arguments]    ${browserType}
#    Run Keyword If    '${browserType}'=='chrome'    Launch Chrome Browser Without Bar
    Run Keyword If    '${browserType}'=='chrome'    Open Browser    ${url}      chrome
    # ...    ELSE IF    '${browserType}'=='firefox'   Open Browser    firefox
    # ...    ELSE IF    '${browserType}'=='ie'    Log    ie
    Maximize Browser Window

##you can safely remove this keyword
# Takes URL as argument and navigates to the URL
# Access Login Page
#     [Arguments]    ${URL}
#     Go To    ${URL}
#     Sleep    1

# Closes browser and quits
Quit
    Close Browser

# Function to define the test setup steps which will be run in the beginning of every test case
Test Case Setup IAL
    [Arguments]    ${browser}    ${URL}
    Platform Setup     ${platform}
#    Launch Browser    ${browser}
    Basic.Access Login Page    ${URL}

# Validates appearance and disappearance of Saving Box in site
Handle iprice Saving Box
    [Arguments]    ${limit}=none
    Sleep    0.5
    :For    ${index}    IN RANGE    ${limit}
    \    Log    ${index}
    \    ${match}=    Get Element Count    ${ipriceos_Icon_Saving}
    \    Run Keyword If    ${match}>0    Run Keyword And Ignore Error    Wait Until Page Does Not Contain Element    ${ipriceos_Icon_Saving}    timeout=20
    \    Run Keyword If    ${match}==0    Exit For Loop
    Run Keyword If    ${match}>0      Fail    The Loading Box Still Displayed


# Validates appearance and disappearance of Loading Box throughout 
Handle Loading Box
    [Arguments]    ${limit}=none
    Sleep    0.5
    :For    ${index}    IN RANGE    ${limit}
    \    Run Keyword And Ignore Error    Wait Until Page Contains Element    ${ipriceos_Icon_ipriceLoading}    timeout=1
    \    ${match}=    Get Element Count    ${ipriceos_Icon_ipriceLoading}
    \    Run Keyword If    ${match}>0    Run Keyword And Ignore Error    Wait Until Page Does Not Contain Element    ${ipriceos_Icon_ipriceLoading}    timeout=20
    \    Run Keyword If    ${match}==0    Exit For Loop
    Run Keyword If    ${match}>0      Capture Page Screenshot
    Run Keyword If    ${match}>0      Fail    The Loading Box Still Displayed

#Note: You can remove this keyword once it is replaced with 'Handle iprice Loading Box'‰
Loading Box
    Sleep   1
    :For    ${index}    IN RANGE    3
    \   Log     ${index}
    \   ${matching_1}=  Get Element Count   ${locator_os_loading_box}
    \   Run Keyword If   ${matching_1}>0   Wait Until Page Does Not Contain Element    ${locator_os_loading_box}   timeout=360
    \   Run Keyword If   ${matching_1}>0   Exit For Loop

#Note: You can remove this keyword once it is replaced with 'Handle iprice Loading Box'
Handle iprice Loading Box
    Sleep   1
    :For    ${index}    IN RANGE    3
    \   Log   ${index}
    \   ${matching_1}=  Get Element Count   ${locator_os_loading_box}
    \   Run Keyword If  ${matching_1}>0   Wait Until Page Does Not Contain Element    ${locator_os_loading_box}   timeout=360
    \   Run Keyword If  ${matching_1}>0   Exit For Loop



Page Scroll Down To Bottom
    Execute JavaScript  [].forEach.call(window.document.querySelectorAll('.container-fluid'), function(site) { site.scrollTop = 99999 })
    Sleep   1

Switch Back To VLE Window
    Select window    title=iprice OS

Switch To iFrame
    Wait Until Page Contains Element    ${ipriceos_iFrame_ExternalServices}    timeout=60
    Select Frame    ${ipriceos_iFrame_ExternalServices}

Auto-Generate Current TimeStamp
    ${date_stamp}=    Get Current Date    time_zone=local    result_format=%Y%m%d%H%M%S
    # ${date_stamp}=    Get Current Date    time_zone=local    result_format=%Y-%m-%d-%H-%M-%S
    [Return]    ${date_stamp}


Auto-Generate Fake Details For New User Creation
    [Arguments]    ${role}
    ${first_name}=    FakerLibrary.First Name
    ${mother_first_name}=    FakerLibrary.First Name Female
    ${father_first_name}=    FakerLibrary.First Name Male
    ${time_stamp}=    Auto-Generate Current TimeStamp
    ${converted_string}=    Convert To Uppercase    ${role}
    ${prefix_string}=    Get Substring    ${converted_string}    0   3

    ${user_IC}    Set Variable    ${time_stamp}${prefix_string}
    ${father_IC}    Set Variable    ${time_stamp}FAT
    ${mother_IC}    Set Variable    ${time_stamp}MOT
    ${user_full_name}    Set Variable    ${first_name} ${prefix_string}
    ${father_full_name}    Set Variable    ${father_first_name} Baba
    ${mother_full_name}    Set Variable    ${mother_first_name} Ama

    &{user_details}    Create Dictionary    'User_IC'=${user_IC}    'User_FullName'=${user_full_name}    'Father_IC'=${father_IC}    'Father_FullName'=${father_full_name}    'Mother_IC'=${mother_IC}    'Mother_FullName'=${mother_full_name}
    [Return]    &{user_details}

Write To File
    [Arguments]    ${file_name}    @{details}
    ${File_Path}    Join Path    ${EXECDIR}    Output    ${file_name}
    :For    ${item}    IN    @{details}
    \    Append To File    ${File_Path}    ${item}
    \    Append To File    ${File_Path}  ${SPACE}${SPACE}${SPACE}
    Append To File    ${File_Path}    ${\n}

Upload File
    [Arguments]    ${x_path}    ${filename}
    ${file_Path}=    Join Path    ${EXECDIR}    TestData/FileUpload    ${file_name}
    File Should Exist    ${file_Path}    The selected file '${file_name}' doesn't exist in FileUpload directory
    Choose File    ${x_path}    ${file_Path}
    Sleep    1

Maximize Application Currently In Focus
    Run Keyword And Continue on Failure    Wait Until Element Is Visible    ${ipriceos_AppModal_Icon_Maximize}
    Run Keyword And Continue on Failure    Click Element    ${ipriceos_AppModal_Icon_Maximize}
    Run Keyword And Continue on Failure    Wait Until Element Is Visible    ${ipriceos_AppModal_Icon_Minimize}


Scroll To An Element In View
    [Arguments]    ${path}
    Execute Javascript    document.getElementByXpath("${path}").scrollIntoView(true);
    # Execute Javascript    window.scroll(0, document.querySelector("${path}").offsetTop - offset);
