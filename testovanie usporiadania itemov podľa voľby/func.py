
try:
    from selenium import webdriver
    from selenium.webdriver.common.by import By
    import time
    from robot.api.deco import keyword
    ROBOT = False
except Exception:
    ROBOT = False

@keyword('SORT')
def vyberMobilu(choice):
    driver = strankaMobilov()
    element = ('//*[@id="root"]/div/div/div/main/section[1]/header/div/nav/div/ul/li[2]/a', '//*[@id="root"]/div/div/div/main/section[1]/header/div/nav/div/ul/li[4]/a')[choice]
    driver.find_element(By.XPATH, element).click()
    time.sleep(2)
    cisla = vytvorZoznam(driver)
    # print(cisla)
    # print(sorted(cisla, reverse=choice))
    #print(('FAIL', 'PASS')[cisla == sorted(cisla, reverse=choice)])
    return cisla == sorted(cisla, reverse=choice)

@keyword('KONTROLA CIEN')
def kontrolaCien(od, do, xpath):
    driver = strankaMobilov()
    driver.find_element(By.XPATH, xpath).click()
    time.sleep(2)
    cisla = vytvorZoznam(driver)
    return skontroluj(int(od), int(do), cisla)

def skontroluj(od, do ,cisla):
    for cislo in cisla:
        if cislo < od or cislo > do: return False
    return True

def vytvorZoznam(driver):
    ul_items = driver.find_element(By.CLASS_NAME, 'c-product-list__items')
    items = ul_items.find_elements(By.TAG_NAME ,"li")
    cisla=[]
    for item in items:
        cislo = vytiahniCenu(item.text)
        if cislo != None : cisla.append(cislo)
    return cisla

def vytiahniCenu(text):
    for s in  text.split('\n'):
        if '€' in s:
            s =s.replace(',','.').replace(' ','')
            return float(s[:s.rfind('–')].replace('–',''))

def strankaMobilov():
    driver = webdriver.Edge()
    driver.get("http://www.herueka.sk")
    
    time.sleep(1)
    driver.find_element(By.XPATH, '//*[@id="didomi-notice-agree-button"]').click()
    time.sleep(1)
    driver.find_element(By.XPATH, '//*[@id="navigation-app"]/div/nav/ul/li[2]/a').click()
    time.sleep(1)
    driver.find_element(By.XPATH, '//*[@id="navigation-app"]/div[1]/nav/ul/li[2]/div/div[2]/div[1]/div[2]/ul/li[1]/a').click()
    time.sleep(2)
    return driver






