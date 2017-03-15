*** Settings ***
Library  Selenium2Library

*** Keywords ***
OpenProductCategory
     Click Element    xpath=//*[@id="ctl00_cphB_ctl00_ctl03_pnlHeading"]
     Sleep            5s
ClickOnShoe
     Click Element     xpath=//*[@value=\"${PRODCATEGORY}\"]/following-sibling::label
     Sleep            5s
SelectFrame
     Wait Until Element is Visible        xpath=//*[@id="sidebarFilteringMenu"]
     Sleep            5s
SaveFilter
    Click Element     xpath=//*[@id="ctl00_cphB_Button1"]
    Sleep             5s