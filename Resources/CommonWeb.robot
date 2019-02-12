*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Begin web test
    Open Browser  about:blank  ${BROWSER}
    maximize browser window

End Web Test
    Close all browsers