*** Setting ***
Resource    ../Modules/Resource.robot

*** Variables ***
${best_deals_stores_list}   //*[@id="homepage"]/div[2]/div/div/amp-carousel/div/div[1]/a/div[string-length(text())>1]
${best_deals_online_store_list}   //*[@id="homepage"]/div[2]/div/div/amp-carousel/div/div[1]/a
${top_trending_products}   //*[@id="homepage"]/div[3]/amp-carousel/div/div[1]/a
${top_trending_products_data_vars_cgt}   //*[@id="homepage"]/div[3]/amp-carousel/div/div[1]/a[@data-vars-cgt]

*** Keywords ***

Validate that each item for “data-vars-cgt”
    FOR    ${INDEX}    IN RANGE    1    ${AllLinksCount}
         Log    ${INDEX}
         Page should contain element   //*[@id="homepage"]/div[3]/amp-carousel/div/div[1]/a[@data-vars-cgt][${INDEX}]
    END
