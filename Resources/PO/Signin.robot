*** Settings ***
Library  Selenium2Library

*** Keywords ***
Add user name
    Input Text      id=txtUserName     ${USERNAME}
    # 0n1oNR!ngZ
Add password
    Input Password  id=txtPassword     0n1oNR!ngZ
Click login button
    Click Element   id=btnLogin

