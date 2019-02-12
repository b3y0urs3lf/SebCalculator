*** Settings ***
Library  SeleniumLibrary
Resource  PO/Landing.robot
Resource  PO/PrivateTopNav.robot
Resource  PO/CarLeasing.robot
Resource  PO/Calculator.robot



*** Variables ***

*** Keywords ***
Go to Calculator page
    Landing.Open Landing Page
    PrivateTopNav.Open Car Leasing Page
    CarLeasing.Verify "Car leasing" Page Loaded
    CarLeasing.Open "Calculator" tab

Validate Calculator page
    Calculator.Verify that Calculator loaded
    Calculator.Verify that Calculator elements accessible

Insert calculation parameters
    Calculator.Verify that Calculator loaded
    [Arguments]  ${OPERATING_LEASE_LABEL}  ${VEHICLE_PRICE}  ${DOWNPAYMENT_VALUE}  ${DOWNPAYMENT_TYPE}  ${CONTRACT_PERIOD}  ${INTEREST_RATE}  ${RESIDUAL_VALUE}
    Calculator.Specify type of Lease  ${OPERATING_LEASE_LABEL}
    Calculator.Specify Vehicle price  ${VEHICLE_PRICE}
    Calculator.Specify Downpayment  ${DOWNPAYMENT_VALUE}  ${DOWNPAYMENT_TYPE}
    Calculator.Specify Contract period  ${CONTRACT_PERIOD}
    Calculator.Specify Interest rate  ${INTEREST_RATE}
    Calculator.Specify Residual value  ${RESIDUAL_VALUE}

Calculate and check that "Monthly payment" and "Payment schedule" appeared
    Calculator.Click on "Schedule" button
    [Arguments]  ${expected_monthly_payment_value}  ${expected_schedule_period}
    Calculator.Verify that "Monthly payment" appeared and as expected  ${expected_monthly_payment_value}
    Calculator.Verify that "Payment schedule" table appeared  ${OPERATING_LEASE_TABLE}
    Calculator.Verify that "Payment schedule" generated for valid period  ${OPERATING_LEASE_TABLE}  ${expected_schedule_period}