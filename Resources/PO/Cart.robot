*** Settings ***
Library  Selenium2Library

*** Keywords ***
GetSomeItems
#      Click Element    xpath=//*[@id="ctl00_cphB_ProductCatalogView1_repeater_ctl11_hlAddProductToCart"]
#      Click Element    xpath=//*[@id="ctl00_cphB_ProductCatalogView1_repeater_ctl03_hlAddProductToCart"]
       Click Element     xpath=//*[@data-productid=\"${PRODUCTID}\"]

      Sleep              5s
OpenCart
     Click Element      id=topMenuCart
     Capture Page Screenshot               cart.png