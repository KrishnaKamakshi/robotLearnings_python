# Demo for Robot Framework Tests

*** Settings ***
Documentation   To Validate the login form
Library     SeleniumLibrary
Test Teardown       Close Browser

*** Variables ***
${error_message_login}      css:.alert-danger
${message_login}        Incorrect username/password.

*** Test Cases ***
Validate successful login into the application
    Open the browser with the Payment URL
    Fill the login form
    Wait for the error message is displayed

*** Keywords ***
Open the browser with the Payment URL
    Create Webdriver    Chrome  executable_path=D:/rbdrivers/chromedriver.exe
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text      id:username     rahulshettyacademy
    Input Text      id:password     1234568dd
    click button    signInBtn

Wait for the error message is displayed
    Wait Until Element Is Visible      ${error_message_login}
    ${result}=  Get Text    ${error_message_login}
    Should Be Equal As Strings  ${result}   ${message_login}
