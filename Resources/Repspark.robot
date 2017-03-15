*** Settings ***
Library      Collections
Library      String

Resource    PO/Signin.robot
Resource    PO/Product.robot
Resource    PO/Cart.robot
Resource    PO/Header.robot
Resource    PO/TopNav.robot


*** Keywords ***

Go to new URL
    Log      This is the begging of something wild
    Read the URL list

Go and Login
    Go to       ${indivURL}
    Signin.Add user name
    Signin.Add password
    Signin.Click login button
    Wait Until Keyword Succeeds      3 x    5 sec    Go To Header

User needs to login
    Signin.Add user name
    Signin.Add password
    Signin.Click login button

Create the purchase order
    Header.SalesPerson DropDownSelect
    Header.Pick Customer
    Header.Add Purchase Order
    Header.Save Header

Salesperson filters products for customer
    Product.OpenProductCategory
    Product.ClickOnShoe
    Product.SelectFrame
    Product.SaveFilter

Salesperson adds items to cart
    Cart.GetSomeItems
    Cart.OpenCart

Check the NavBar
    TopNav.Open Products
    TopNav.Open Wish Lists
    TopNav.Open My Orders
    TopNav.Open Order Status
    TopNav.Open Reports
    TopNav.Open Marketing
    TopNav.Open Forcasting

Data Driven Web Testing
    Read the URL list

Check the header
    Log    Checking the Header Components
    Header.Check the header items

Read the URL list
#     ${contents} =     Get File             tests/urlshort.txt
     ${contents} =     Get File             tests/new.txt
     @{lines} =        Split To Lines       ${contents}
     :FOR    ${line}   IN    @{lines}
     \    @{words} =    Split String         ${line}    \|
     \    Set Global Variable      ${indivURL}       @{words}[-1]
     \    Set Global Variable      ${ClientName}     @{words}[0]
     \    Log     ${ClientName}
     \    Log     ${indivURL}
     \    Set Global Variable      ${switch]     'off'
     \    Go and Login
     \    Continue For Loop If     "${switch]" == 'on'
     Log     Done with Test
