*** Settings ***
Library      DatabaseLibrary
Library      OperatingSystem

Resource    ../Resources/Common.robot
Resource    ../Resources/Repspark.robot
Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${Port}            1433
${DBUSERNAME}      sa
#${DatabaseHost}    10.10.0.1
${DatabaseHost}    vrsksql.d.repspark.net
${DatabaseName}    RepSpark.Common
${DBPASSWORD}      0P7q2LBnGfabP0DLOs3y
@{QueryResult}
${RowCount}       ${EMPTY}
${BROWSER} =    chrome
${USERNAME} =   repspark_rw
${Password} =   0n1oNR!ngZ
${PRODUCTID} =  2066
${PRODCATEGORY} =  SHOE
${CUSTOMERNAME} =  50 EAST SHOES- NASHVILLE
${SALESPERSON} =  BILL NELSON
${URL} =  http://www.repspark.com
${DSN} =  'ODBC://sa:0P7q2LBnGfabP0DLOs3y@vrsksql.d.repspark.net/repspark.OluKai';
${Port} =  1433
${ClientName}
${queryResults}
@{output}
${RowCount}


*** Test Cases ***
Data Driven Web Testing
    [Tags]     dataDriven
    RepSpark.Data Driven Web Testing

Welcome to the repspark sales app
    [Tags]     basicOrder
    Repspark.User needs to login
    Repspark.Create the purchase order
    Repspark.Salesperson filters products for customer
    Repspark.Salesperson adds items to cart

Lets check the navBar
    [Tags]     checkNavBar
    Repspark.User needs to login
    Repspark.Open the Header

#Lets check the dropShip
#    [Tags]     checkDropShip
#    Repspark.User needs to login
#    Repspark.Run a query
#    Repspark.Create dictionary
