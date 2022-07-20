*** Settings ***
Documentation   To Validate the login form
...             This used for learning Automation by using Robot Framework
Library     SeleniumLibrary
Library     OperatingSystem


*** Variables ***
${user_name}        rahulshettyacademy
${password_invalid}     1234587
${valid_password}       learning
${cardName}     Blackberry

*** Keywords ***

Open the browser with the Payment URL
    Create Webdriver    Chrome  executable_path=D:/rbdrivers/chromedriver.exe
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Close Browser Session
    Close Browser