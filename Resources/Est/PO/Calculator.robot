*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CALCULATOR_IFRAME}  xpath=//iframe[@class='calculator-frame']
#Type of lease
${OPERATING_LEASE_LABEL}  xpath=//label[@for='calc08-type01']
${OPERATING_LEASE_RADIOBUTTON}  xpath=//input[@id='calc08-type01']
${FINANCIAL_LEASE_LABEL}  xpath=//label[@for='calc08-type02']
${FINANCIAL_LEASE_RADIOBUTTON}  xpath=//input[@id='calc08-type02']
${FIANANCIAL_LEASE_WITHOUT_VAT_LABEL}  xpath=//label[@for='calc08-type03']
${FIANANCIAL_LEASE_WITHOUT_VAT_RADIOBUTTON}  xpath=//input[@id='calc08-type03']
#Price of the vehicle
${VEHICLE_PRICE_LABEL}  xpath=//label[@for='calc08-sum']
${VEHICLE_PRICE_INPUT}  xpath=//input[@id='calc08-sum']
#Downpayment
${DOWNPAYMENT_LABEL}  xpath=//label[@for='calc08-deposit']
${DOWNPAYMENT_INPUT}  xpath=//input[@id='calc08-deposit']
${DOWNPAYMENT_TYPE_DROPDOWN}  xpath=//select[@id='calc08-deposit-type']
#Contract period
${CONTRACT_PERIOD_LABEL}  xpath=//label[@for='calc08-period']
${CONTRACT_PERIOD_DROPDOWN}  xpath=//select[@id='calc08-period']
#Interest rate
${INTEREST_RATE_LABEL}  xpath=//label[@for='calc08-int']
${INTEREST_RATE_INPUT}  xpath=//input[@id='calc08-int']
#Residual value
${RESIDUAL_VALUE_LABEL}  xpath=//label[@for='calc08-salvage-value']
${RESIDUAL_VALUE_INPUT}  xpath=//input[@id='calc08-salvage-value']
#Buttons
${ADD_TO_COMPARISSION_BUTTON}  xpath=//a[@class='calc08-action-compare']
${SCHEDULE_BUTTON}  xpath=//input[@type='submit' and @id='value-payment-schedule']
#Monthly payment xpath
${MONTHLY_PAYMENT_XPATH}  xpath=//span[@id='monthly-result']
#Schedule tables
${OPERATING_LEASE_TABLE}  xpath=//table[@id='calc08-kas-graph']
${FINANCIAL_LEASE_TABLE}  xpath=//table[@id='calc08-kap-graph']
${FIANANCIAL_LEASE_WITHOUT_VAT_LEASE_TABLE}  xpath=//table[@id='calc08-jm-graph']


*** Keywords ***
Verify that Calculator loaded
    Select Frame  ${CALCULATOR_IFRAME}
    Wait until page contains  Please note! The amounts, calculated using the calculator are informative!

Verify that Calculator elements accessible
    Element should be visible  ${operating_lease_label}
    Element should be visible  ${operating_lease_radiobutton}
    Element should be visible  ${financial_lease_label}
    Element should be visible  ${financial_lease_radiobutton}
    Element should be visible  ${fianancial_lease_without_vat_label}
    Element should be visible  ${fianancial_lease_without_vat_radiobutton}
    Element should be visible  ${vehicle_price_label}
    Element should be visible  ${vehicle_price_input}
    Element should be visible  ${downpayment_label}
    Element should be visible  ${downpayment_input}
    Element should be visible  ${downpayment_type_dropdown}
    Element should be visible  ${contract_period_label}
    Element should be visible  ${contract_period_dropdown}
    Element should be visible  ${interest_rate_label}
    Element should be visible  ${interest_rate_input}
    Element should be visible  ${residual_value_label}
    Element should be visible  ${residual_value_input}
    Element should be visible  ${add_to_comparission_button}
    Element should be visible  ${schedule_button}

Specify type of Lease
    [Arguments]  ${OPERATING_LEASE_LABEL}
    Click element  ${OPERATING_LEASE_LABEL}

Specify Vehicle price
    [Arguments]  ${VEHICLE_PRICE}
    Clear element text  ${VEHICLE_PRICE_INPUT}
    Input text  ${VEHICLE_PRICE_INPUT}  ${VEHICLE_PRICE}

Specify Downpayment
    [Arguments]  ${DOWNPAYMENT_VALUE}  ${DOWNPAYMENT_TYPE}
    Select from list by value  ${DOWNPAYMENT_TYPE_DROPDOWN}  ${DOWNPAYMENT_TYPE}
    Clear element text  ${DOWNPAYMENT_INPUT}
    Input text  ${DOWNPAYMENT_INPUT}  ${DOWNPAYMENT_VALUE}

Specify Contract period
    [Arguments]  ${CONTRACT_PERIOD}
    Select from list by value  ${CONTRACT_PERIOD_DROPDOWN}  ${CONTRACT_PERIOD}

Specify Interest rate
    [Arguments]  ${INTEREST_RATE}
    Clear element text  ${INTEREST_RATE_INPUT}
    Input text  ${INTEREST_RATE_INPUT}  ${INTEREST_RATE}

Specify Residual value
    [Arguments]  ${RESIDUAL_VALUE}
    Clear element text  ${RESIDUAL_VALUE_INPUT}
    Input text  ${RESIDUAL_VALUE_INPUT}  ${RESIDUAL_VALUE}

Click on "Schedule" button
    Click element  ${SCHEDULE_BUTTON}

Verify that "Monthly payment" appeared and as expected
    Wait until page contains element   ${MONTHLY_PAYMENT_XPATH}
    ${actual_monthly_payment} =  Get text  ${MONTHLY_PAYMENT_XPATH}
    [Arguments]  ${expected_monthly_payment_value}
    Should Be Equal As Strings  ${actual_monthly_payment}  ${expected_monthly_payment_value}

Verify that "Payment schedule" table appeared
    [Arguments]  ${expected_table}
    Wait until page contains element  ${expected_table}

Verify that "Payment schedule" generated for valid period
    [Arguments]  ${expected_table}  ${expected_schedule_period}
    ${actual_schedule_period} =  Get text  ${expected_table}/tbody/tr[last()]/preceding-sibling::tr[1]/td[1]
    Should Be Equal As Strings  ${actual_schedule_period}  ${expected_schedule_period}


