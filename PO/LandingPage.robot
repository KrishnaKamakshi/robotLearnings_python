*** Settings ***
Documentation   This Page state the functionality of landing Page and all the locators
Library     SeleniumLibrary
Library     OperatingSystem


*** Keywords ***

Fill the login form
    [arguments]     ${username}     ${password}
    Input Text      id:username     ${username}
    Input Text      id:password     ${password}
    click button    signInBtn