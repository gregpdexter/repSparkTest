*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  BuiltIn

*** Keywords ***
Go To Header
     Click Button     xpath=//*[@id="toggleHeaderButton"]
#    Element Text Should Be      xpath=//*[@id="statusHold"]     Customer\'s credit status is: Inactive
     Run A Query

Run A Query
       Log      ${ClientName}
       ${queryResults} =  QUERY      select C.ClientName, CR.StringValue0 from [RepSpark.Common].dbo.RSK_Clients C join [RepSpark.Common].dbo.RSK_ClientRules CR on C.ClientId=CR.ClientId join [RepSpark.Common].dbo.RSK_Rule R on R.RuleId = CR.RuleId where R.Code='ORDERWIZARDHEADER_ONETIMESHIPTO_VISIBLE' and ( CR.OnlyForRoles='All' or CR.OnlyForRoles='Administrator,Manager,CustomerService,SalesPerson') and ClientName='${ClientName}' and C.ClientName is not NULL and CR.StringValue0 is not NULL and C.ClientName != '' and CR.StringValue0 != ''
        ${length} =	Get Length	${queryResults}
       Set Global Variable      ${queryResults}
       Run Keyword If       ${length} > 0        dropShipTrueFalse
       Run Keyword If       ${length} == 0       dropShipTableStatusFail
       Set Global Variable    ${switch]    'on'

dropShipTrueFalse
       Log Many     ${queryResults}
       ${length} =	Get Length	${queryResults}
       Log      ${length}
#      Run Keyword If     '${queryResults[0][1]}' == "true"     dropShipTableStatusPass
#      Run Keyword If     '${queryResults[0][1]}' != "true"     dropShipTableStatusFail

dropShipTableStatusPass
    Log    Drop Ship Status is True

dropShipTableStatusFail
    Log    Drop Ship Status is False

SalesPerson DropDownSelect
     Click Element       xpath=//*[@id="salespersondropdown"]
     Click Element       xpath=//*[contains(text(), \'${SALESPERSON}\')]
     Sleep    15s
Pick Customer
     Click Element    id=statusbarCustomer
     Sleep            5s
     ${elem} =	      Get WebElement	  xpath=//*[@id="customerPickerScroll"]/div[1]/div[2]/div[2]/button
     Click Button     ${elem}
     Sleep            5s
     Click Element    xpath=//*[@id="customerTable"]/tbody/tr/td[contains(text(), \'${CUSTOMERNAME}\')]
     Sleep            15s
Add Purchase Order
     Click Button     xpath=//*[@id="toggleHeaderButton"]
#     Element Text Should Be      xpath=//*[@id="statusHold"]     Customer\'s credit status is: Inactive
     Sleep            5s
     Input Text       //*[@id="txtPurchaseOrder"]  Robot1
     Sleep            5s
Save Header
     Click Button     xpath=//*[@id="btnSaveHeader"]
     Sleep            5s

Check the header items
     Log    Inside Check the Header
     Click Button     xpath=//*[@id="toggleHeaderButton"]





