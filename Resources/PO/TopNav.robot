*** Settings ***
Library  Selenium2Library

*** Keywords ***
Open Products
    Log     Opening Products
    Click Link  link=Products
Open Wish Lists
    Log     Opening Wish Lists
    Click Link  link=Wish Lists
Open My Orders
    Log     Opening My Orders
    Click Link  link=My Orders
Open Order Status
    Log     Opening Order Status
    Click Link  link=Order Status/Invoices
Open Reports
    Log     Opening Reports
    Click Link  link=Reports
Open Marketing
    Log     Opening Marketing
    Click Link  link=Marketing
Open Forcasting
    Log     Opening Forcasting
    Click Link  link=Forecasting
