*** Setting ***
Resource    ../../Modules/Resource.robot

#Setup/Tear Down
Test Setup	Test Case Setup	${platform}	${env}  ${url_coupons}
Test Teardown	Close Browser
# robot -d reports -i tc02 -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_2.robot
# robot -d reports -T -i tc02 -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_2.robot

*** Variables ***
${workforce_select_lang_dropdown}   //*[@id="welcome-sect"]/div[2]/div[3]/div[1]/select
${workforce_username_textbox}   //*[@id="welcome-sect"]/div[2]/div[3]/div[3]/form/ion-input[1]/input[@name="email"]
${workforce_password_textbox}   //*[@id="welcome-sect"]/div[2]/div[3]/div[3]/form/ion-input[2]/input[@name="password"]
${workforce_signin_button}   //*[@id="login-button"]
*** Keywords ***
launch workforce
    [Arguments]   ${url}
    Go To   ${url}
    Run Keyword and continue on Failure     Wait Until Element Is Visible   ${workforce_select_lang_dropdown}   timeout=12
    Set test variable   ${title}      Get Title

signin input username
    [Arguments]  ${username}
    Run Keyword and continue on Failure  Wait Until Element Is Visible   ${workforce_username_textbox}  timeout=12
    Run Keyword and continue on Failure  Wait Until Keyword Succeeds  5x  500ms   Input text  ${workforce_username_textbox}  ${username}

signin input password
    [Arguments]  ${password}
    Run Keyword and continue on Failure  Wait Until Element Is Visible   ${workforce_password_textbox}   timeout=12
    Run Keyword and continue on Failure  Wait Until Keyword Succeeds  5x  500ms   Input text  ${workforce_password_textbox}   ${password}

click sign in button
    Run Keyword and continue on Failure  Wait Until Element Is Visible   ${workforce_signin_button}   timeout=12
    Run Keyword and continue on Failure  Wait Until Keyword Succeeds  5x  500ms   Click Element   ${workforce_signin_button}


Validate that each item for “data-vars-cgt”
    FOR    ${INDEX}    IN RANGE    1    ${AllLinksCount}
         Log    ${INDEX}
         Page should contain element   //*[@id="homepage"]/div[3]/amp-carousel/div/div[1]/a[@data-vars-cgt][${INDEX}]
    END

*** Test Cases ***
a. Make sure that url of stores in "Top Stores” are all active
	[tags]	smoke	tc01
    ${element_list}=     get webelements     //*[@id="coupon-overview"]/div/div[2]/div/div/div[1]/section/div/a[@href]
    ${href_list}=  Evaluate  [item.get_attribute('href') for item in $element_list]
    Log    ${href_list}

    Create Session    testing    ${BASE_URL}
    FOR    ${element_href}    IN    @{href_list}
        ${uri}=    Remove String    ${element_href}    ${BASE_URL}
        ${contains_base_url}=    Evaluate     "${BASE_URL}" in "${element_href}"
        ${response}=    Run Keyword If    ${contains_base_url}    GET On Session    testing    ${uri}
        Run Keyword If    ${contains_base_url}    Should Be Equal As Strings     ${response.status_code}    200
    END

b. Make sure that list of stores in "Top Stores” is redirected to their proper store url
	[tags]	smoke	tc02
    ${element_list}=     get webelements     //*[@id="coupon-overview"]/div/div[2]/div/div/div[1]/section/div/a[@href]
    ${href_list}=  Evaluate  [item.get_attribute('href') for item in $element_list]
    Log    ${href_list}

    Create Session    test_redirect    ${BASE_URL}
    FOR    ${element_href}    IN    @{href_list}
        ${uri}=    Remove String    ${element_href}    ${BASE_URL}
        ${contains_base_url}=    Evaluate     "${BASE_URL}" in "${element_href}"
        ${response}=    Run Keyword If    ${contains_base_url}    GET On Session      test_redirect    ${uri}   # allow_redirects=true
        Run Keyword If    ${contains_base_url}    Should Be Equal As Strings     ${response.status_code}    200
        Run Keyword And Continue On Failure  Should Be True  ${response.status_code}==200
        # Log To Console  ${response.content}
    END

b.1 Make sure that list of stores in "Top Stores” is redirected to their proper store url
    Go to    https://a-z-animals.com/animals/
    ${href} =    Get element count    //*[@id="single-content"]/div/ul/li
    :FOR    ${i}  IN RANGE   ${href}
    \    ${url}=   get element attribute   xpath=//a[text()='More information...']  href
    go to   https://www.blogger.com/u/0/onboarding
    debug
    
    Should be equal  ${url}  http://www.iana.org/domains/example
