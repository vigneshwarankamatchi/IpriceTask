*** Setting ***
Resource    ../../Modules/Resource.robot

#Setup/Tear Down
Test Setup	Test Case Setup 	${platform} 	${env}  ${url}
Test Teardown	Close Browser

# robot -d reports -T -i smoke -V vars/preprod.yaml -v remote_url:None  TestCases/Smoke/demo_test_1_bdd.robot 

*** Variables ***
${iprice_url}   https://iprice.my/

*** Keywords ***
iprice homepage loaded
    Wait Until Element is Visible     ${best_deals_online_store_list}

grab all the stores link
    ${AllLinksCount}=    Get Element Count    ${best_deals_online_store_list}
    Log    ${AllLinksCount}
    @{LinkItems}    Create List
    Set Test Variable   ${LinkItems}
    # Loop through all links and store links value that has length more than 1 character
    FOR    ${INDEX}    IN RANGE    1    ${AllLinksCount}
         Log    ${INDEX}
         ${lintext}=    Get Text    //*[@id="homepage"]/div[2]/div/div/amp-carousel/div/div[1]/a[${INDEX}]/div
         Log    ${lintext}
         ${linklength}    Get Length    ${lintext}
         Run Keyword If    ${linklength}>1    Append To List    ${LinkItems}    ${lintext}
    END

print all the grabbed links
    ${LinkSize}=    Get Length    ${LinkItems}
    Log    ${LinkSize}

    Comment    Print all links
    FOR    ${ELEMENT}    IN    @{LinkItems}
         Log    ${ELEMENT}
    END 

get best deals stores list and count
    Wait Until Element is Visible     ${best_deals_stores_list}
    ${AllLinksCount}=    Get Element Count    ${best_deals_stores_list}
    Set Test Variable  ${AllLinksCount}
    Log    ${AllLinksCount}

print the stores count
    Log   There are ${AllLinksCount} list of the stores in the “Find the Best Deals Online”

iprice top trending products loaded
    Wait Until Element is Visible     ${top_trending_products}

When get top trending products and count
    ${AllLinksCount}=    Get Element Count    ${top_trending_products}
    Set Test Variable  ${AllLinksCount}
    Log    ${AllLinksCount}

Then print top trending products count
    Log   There are ${AllLinksCount} items in “Top Trending Products”


verify each item in “Top Trending Products” contains “data-vars-cgt”
    Log   There are ${AllLinksCount} items in “Top Trending Products”
    ${data-vars-cgt-Count}=    Get Element Count    ${top_trending_products_data_vars_cgt} 
    Log    ${data-vars-cgt-Count}
    Log   There are ${data-vars-cgt-Count} iitem in “Top Trending Products” contains “data-vars-cgt”

    Run Keyword if   ${AllLinksCount} == ${data-vars-cgt-Count}   log   All the items in “Top Trending Products” contains “data-vars-cgt”
    Run Keyword if   ${AllLinksCount} != ${data-vars-cgt-Count}   Validate that each item for “data-vars-cgt”



*** Test Cases ***
a. Grab the list of stores in the “Find the Best Deals Online”
	[tags]	smoke	tc01
    Given iprice homepage loaded
    When grab all the stores link
    Then print all the grabbed links

b. Count the list of the stores in the “Find the Best Deals Online”
	[tags]	smoke	tc02
    Given iprice homepage loaded
    When get best deals stores list and count
    Then print the stores count

c. Count the list of items in “Top Trending Products”
	[tags]	smoke	tc03
    Given iprice top trending products loaded
    When get top trending products and count
    Then print top trending products count

d. Validate that each item in “Top Trending Products” contains “data-vars-cgt”
	[tags]	smoke	tc04
    Given iprice top trending products loaded
    When get top trending products and count
    Then verify each item in “Top Trending Products” contains “data-vars-cgt”

