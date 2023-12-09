
*** Settings ***
Library    SeleniumLibrary
Library    func.py
Library    Collections
Variables    itemy.py
*** Variables ***
${Browser}    Edge
${URL}     https://www.heureka.sk/  
*** Test Cases ***
pridanie itemov
    pridanie itemov
    Close Browser

kontrola sumy 
    pridanie itemov 
    Wait Until Element Is Visible    xpath=//*[@id="frm-quantity-quantity"]
    Wait Until Element Is Enabled    xpath=//*[@id="frm-quantity-quantity"]
    Textfield Value Should Be    //*[@id="frm-quantity-quantity"]    1
    Sleep    2s
    ${result}=     Get Text    xpath=//*[@id="snippet--cart-content-data"]/div[3]/div/div/div[2]/div[2]/div[2]
    ${result}=    VYNASOB    ${result}    2   
    Click Element    //*[@id="snippet--cart-content-data"]/div[3]/div/div/div[2]/div[2]/div[1]/a
    Sleep    2s
    Element Text Should Be   xpath=//*[@id="snippet--cart-content-data"]/div[3]/div/div/div[2]/div[2]/div[2]    ${result}
    Close Browser
odobratie itemu
    
    pridanie itemov
    ${pocet_akt}=   ZNIZ POCET    2    
    Wait Until Element Is Visible      //*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/a
    Wait Until Element Is Enabled    //*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/a
    Click Element    //*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/a
    Wait Until Element Is Visible    //*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/section/div/footer/a
    Wait Until Element Is Enabled    //*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/section/div/footer/a
    Click Element    //*[@id="snippet--cart-content-data"]/div[3]/div/div/div[1]/section/div/footer/a
    Element Attribute Value Should Be    //*[@id="rootHead"]/ul/li[3]/a/span[1]     data-count    ${pocet_akt}
    Close Browser

*** Keywords ***
pridanie itemov   
    Open Browser    ${URL}   ${Browser}
    Maximize Browser Window
    Delete All Cookies
    Sleep    2s
    ${keys}    Get Dictionary Keys   ${ITEMS}    sort_keys=False
    ${values}   Get Dictionary Values   ${ITEMS}    sort_keys=False
    ${length}   Get Length      ${keys}
    Run Keyword And Ignore Error    Click Button    xpath=//*[@id="didomi-notice-agree-button"]
     FOR     ${i}    IN RANGE   0    ${length}
        ${item_values}     Get From List   ${values}   ${i}
        ${itemLength}    Get Length    ${item_values}
        ${search_elem}    Get From List    ${keys}    ${i}  
        Input Text    xpath=//*[@id="rootHead"]/form/input     ${search_elem}
        Press Keys   None    ENTER
        FOR  ${j}  IN RANGE  0    ${itemLength} 
            ${click_elem}    Get From List    ${item_values}    ${j} 
            Wait Until Element Is Visible   ${click_elem} 
            Click Element     ${click_elem}    
        END
    END


    Wait Until Element Is Visible    xpath=//*[@id="__next"]/div/main/div[2]/div[1]/div/div[3]/aside/div/div/div[2]/div[2]/a
    Wait Until Element Is Enabled    xpath=//*[@id="__next"]/div/main/div[2]/div[1]/div/div[3]/aside/div/div/div[2]/div[2]/a
    Click Element    xpath=//*[@id="__next"]/div/main/div[2]/div[1]/div/div[3]/aside/div/div/div[2]/div[2]/a
    Sleep    2s
    Reload Page
    Sleep    2s
    Element Attribute Value Should Be    //*[@id="rootHead"]/ul/li[3]/a/span[1]     data-count    ${length}