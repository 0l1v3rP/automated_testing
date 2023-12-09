*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}    chrome     
${URL}    https://www.heureka.sk/ 
${e-mail}    t940650@gmail.com
${hesloT}    sdaf3\\$45FGD3%@
${hesloF}    sdfdsfs

*** Test Cases ***

prihlasovanie na herueka.sk s validnymi udajmi
    Prihlasanie
    Close Browser

prihlasovanie na herueka.sk bez zadanie prihlasovacieho mena a hesla

    Stranka Prihlasovania
    Wait Until Element Is Visible    xpath=//*[@id="frm-loginForm-loginForm"]/fieldset/footer/button
    Click Button   xpath=//*[@id="frm-loginForm-loginForm"]/fieldset/footer/button
    Sleep    2s
    Close Browser
    
prihlasovanie na herueka.sk s nespravnym heslom

    Stranka Prihlasovania
    Wait Until Element Is Visible   id:frm-loginForm-loginForm-email
    Input Text    id:frm-loginForm-loginForm-email    ${e-mail}
    Wait Until Element Is Visible    id:frm-loginForm-loginForm-password
    Input Text    id:frm-loginForm-loginForm-password    ${hesloF}       
    Wait Until Element Is Visible    xpath=//*[@id="frm-loginForm-loginForm"]/fieldset/footer/button
    Click Button   xpath=//*[@id="frm-loginForm-loginForm"]/fieldset/footer/button
    Sleep    20s
    Close Browser

odhlasovanie z herueka.sk
    Prihlasanie
    Wait Until Element Is Enabled    //*[@id="rootHead"]/ul/li[4]/a
    Click Element    //*[@id="rootHead"]/ul/li[4]/a
    Wait Until Element Is Enabled     //*[@id="rootHead"]/ul/li[4]/ul/li[7]/a
    Click Element    //*[@id="rootHead"]/ul/li[4]/ul/li[7]/a
    Close Browser

*** Keywords ***

Stranka Prihlasovania
    Open Browser  ${URL} ${browser}
    Maximize Browser Window
    Run Keyword And Ignore Error    Click element    xpath=//*[@id="didomi-notice-agree-button"]
    Wait Until Element Is Visible   xpath=//*[@id="rootHead"]/ul/li[4]
    Click Element    xpath=//*[@id="rootHead"]/ul/li[4]

Prihlasanie
    Stranka Prihlasovania
    Wait Until Element Is Visible   id:frm-loginForm-loginForm-email
    Input Text    id:frm-loginForm-loginForm-email    ${e-mail}
    Wait Until Element Is Visible    id:frm-loginForm-loginForm-password
    Input Text    id:frm-loginForm-loginForm-password    ${hesloT}
    Click Button   xpath=//*[@id="frm-loginForm-loginForm"]/fieldset/footer/button
    Sleep    2s