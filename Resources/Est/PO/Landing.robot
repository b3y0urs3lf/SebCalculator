*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BANK_LOGO}  xpath=(//img[@alt='S|E|B'])[1]
*** Keywords ***
Open Landing Page
    Navigate to
    Verify "Landing" Page Loaded

Navigate to
    Go to  ${URL}

Verify "Landing" Page Loaded
    wait until page contains element  ${BANK_LOGO}