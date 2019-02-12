*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CAR_LEASING_MAIN_HEADING} =  xpath=(//h1)[1]
${CAR_LEASING_CALCULATOR_LINK}  //a[@href="#calculator-tab"]
*** Keywords ***
Verify "Car leasing" Page Loaded
    Wait until page contains element  ${CAR_LEASING_MAIN_HEADING}
    Element text should be  ${CAR_LEASING_MAIN_HEADING}  Car leasing

Open "Calculator" tab
    Click link  ${CAR_LEASING_CALCULATOR_LINK}