*** Setting ***
Resource    ../../Modules/Resource.robot

#Setup/Tear Down
Test Setup	Test Case Setup 	${platform} 	${env}  ${url}
Test Teardown	Close Browser

# robot -d reports -T -i smoke -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_2.robot 

*** Variables ***
${iprice_url}   https://iprice.my/


*** Test Cases ***
a. Grab the list of stores in the “Find the Best Deals Online”
	[tags]	smoke	tc01
    Go To   ${url}
    Wait Until Element is Visible     //*[@id="homepage"]/div[2]/div/div/amp-carousel/div/div[1]/a[1]
    # Count number of links on page
    ${AllLinksCount}=    Get Element Count    //*[@id="homepage"]/div[2]/div/div/amp-carousel/div/div[1]/a

    # Log the count of links
    Log    ${AllLinksCount}

    # Create a list to store the link texts
    @{LinkItems}    Create List

    # Loop through all links and store links value that has length more than 1 character
    FOR    ${INDEX}    IN RANGE    1    ${AllLinksCount}
         Log    ${INDEX}
         ${lintext}=    Get Text    //*[@id="homepage"]/div[2]/div/div/amp-carousel/div/div[1]/a[${INDEX}]/div
         Log    ${lintext}
         ${linklength}    Get Length    ${lintext}
         Run Keyword If    ${linklength}>1    Append To List    ${LinkItems}    ${lintext}
    END

    ${LinkSize}=    Get Length    ${LinkItems}
    Log    ${LinkSize}

    Comment    Print all links
    FOR    ${ELEMENT}    IN    @{LinkItems}
         Log    ${ELEMENT}
    END 

b. Count the list of the stores in the “Find the Best Deals Online”
	[tags]	smoke	tc02
    Wait Until Element is Visible     ${best_deals_stores_list}
    ${AllLinksCount}=    Get Element Count    ${best_deals_stores_list}
    Log    ${AllLinksCount}
    Log   There are ${AllLinksCount} list of the stores in the “Find the Best Deals Online”

c. Count the list of items in “Top Trending Products”
	[tags]	smoke	tc03
    Wait Until Element is Visible     ${top_trending_products}
    ${AllLinksCount}=    Get Element Count    ${top_trending_products}
    Log    ${AllLinksCount}
    Log   There are ${AllLinksCount} items in “Top Trending Products”

d. Validate that each item in “Top Trending Products” contains “data-vars-cgt”
	[tags]	smoke	tc04
    Wait Until Element is Visible     ${top_trending_products}
    ${AllLinksCount}=    Get Element Count    ${top_trending_products}
    Log    ${AllLinksCount}
    Log   There are ${AllLinksCount} items in “Top Trending Products”
    ${data-vars-cgt-Count}=    Get Element Count    ${top_trending_products_data_vars_cgt} 
    Log    ${data-vars-cgt-Count}
    Log   There are ${data-vars-cgt-Count} iitem in “Top Trending Products” contains “data-vars-cgt”

    Run Keyword if   ${AllLinksCount} == ${data-vars-cgt-Count}   log   All the items in “Top Trending Products” contains “data-vars-cgt”
    Run Keyword if   ${AllLinksCount} != ${data-vars-cgt-Count}   Validate that each item for “data-vars-cgt”

