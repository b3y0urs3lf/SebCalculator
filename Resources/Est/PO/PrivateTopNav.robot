*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOAN_LEASING_MENU_OPTION}  xpath=//div[@id='block-seb-dropdown-menu']//ul/li[4]/a[@class='hasdrop nolink']
${DROPDOWN_CAR_LEASING_OPTION}  //div[@id='menu01dropContent']//a/span[text()='Car leasing']
*** Keywords ***
Open Car Leasing Page
    Select "Car leasing" from dropdown menu

Select "Car leasing" from dropdown menu
    Mouse over  ${LOAN_LEASING_MENU_OPTION}
    Wait until page contains element  ${DROPDOWN_CAR_LEASING_OPTION}
    Click element   ${DROPDOWN_CAR_LEASING_OPTION}