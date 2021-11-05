*** Setting ***
Resource    ../../Modules/Resource.robot

#Setup/Tear Down
Test Setup	Test Case Setup	${platform}	${env}  ${url_coupons}
Test Teardown	Close Browser
# robot -d reports -i tc02 -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_2.robot
# robot -d reports -T -i tc02 -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_2.robot

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
	[tags]	smoke	tc03
    Wait Until Element is Visible     //*[@id="coupon-overview"]/div/div[2]/div/div/div[1]/section/div/a[@href]
    ${href} =    Get element count    //*[@id="coupon-overview"]/div/div[2]/div/div/div[1]/section/div/a[@href]
    FOR    ${i}  IN RANGE   1   ${href}
        ${url}=   get element attribute   //*[@id="coupon-overview"]/div/div[2]/div/div/div[1]/section/div[${i}]/a[@href]  href
        go to   ${url}
        ${location}=   Get Location
        Should be equal  ${url}   ${location}
        go to   ${url_coupons}
    END