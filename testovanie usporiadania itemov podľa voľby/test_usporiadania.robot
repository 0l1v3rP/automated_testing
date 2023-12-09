*** Settings ***
Library  SeleniumLibrary
Library  func.py

*** Variables ***
*** Test Cases ***
od najdrahsieho
    ${is_true}=    SORT    ${True}
    Should Be True     ${is_true}
od najlacnejsieho
    ${is_true}=    SORT    ${False}
    Should Be True     ${is_true}

od 0 do 100 
    ${is_true}=    KONTROLA CIEN    0    100    //*[@id="cena"]/div/div/div[2]/div/ul/li[1]/div/label[1]    
     Should Be True     ${is_true}

od 300 do 500
    ${is_true}=    KONTROLA CIEN    300    500    //*[@id="cena"]/div/div/div[2]/div/ul/li[4]/div/label[1]
     Should Be True     ${is_true}
