*** Settings ***
Library  Selenium2Library

*** Keywords ***
Begin Web Test
    Connect to Database    pymssql    ${DatabaseName}    ${DBUSERNAME}    ${DBPASSWORD}    ${DatabaseHost}    ${Port}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window


End Web Test
    Close Browser
    Disconnect From Database
