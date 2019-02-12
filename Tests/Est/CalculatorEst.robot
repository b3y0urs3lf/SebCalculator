*** Settings ***
Documentation  Following test suite will test SEB car loan calculator application that is available for Estonian market
Resource  ../../Resources/Est/CalculatorApp.robot
Resource  ../../Resources/CommonWeb.robot

Test Setup  Begin web test
Test Teardown  End Web Test

#robot -d Results Tests/Est/CalculatorEst.robot
*** Variables ***
${BROWSER} =  Chrome
${URL} =  http://www.seb.ee/eng
${VEHICLE_PRICE} =  10000
${DOWNPAYMENT_VALUE} =  10
${DOWNPAYMENT_TYPE} =  2  #type == %
${CONTRACT_PERIOD} =  30
${INTEREST_RATE} =  3.5
${RESIDUAL_VALUE} =  15
${MONTHLY_PAYMENT_VALUE} =  263,37 euros

*** Test Cases ***
Should be able to access and view calculator
    [Documentation]  Test will check that SEB Car Loan Calculator and its elements accessible
    [Tags]  access
    CalculatorApp.Go to Calculator page
    CalculatorApp.Validate Calculator page

Calcualtion returns valid "Monthly payment" and "Payment schedule"
    [Documentation]  Test will check that calcualtion returns valid "Montlhy payment" and "Payment schedule"
    [Tags]  calculation
    CalculatorApp.Go to Calculator page
    CalculatorApp.Insert calculation parameters  ${OPERATING_LEASE_LABEL}  ${VEHICLE_PRICE}  ${DOWNPAYMENT_VALUE}  ${DOWNPAYMENT_TYPE}  ${CONTRACT_PERIOD}  ${INTEREST_RATE}  ${RESIDUAL_VALUE}
    CalculatorApp.Calculate and check that "Monthly payment" and "Payment schedule" appeared  ${MONTHLY_PAYMENT_VALUE}  ${CONTRACT_PERIOD}
