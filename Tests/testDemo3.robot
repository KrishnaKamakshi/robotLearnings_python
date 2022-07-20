# Demo for Robot Framework Tests

*** Settings ***
Documentation   To Validate the login form
Library     SeleniumLibrary
Library     String
Library     Collections


Library     Collections
Test Setup      Open the browser with the Payment URL
Test Teardown       Close Browser Session
Resource        resource.robot

*** Variables ***
${error_message_login}      css:.alert-danger
${message_login}        Incorrect username/password.
${nav_tes}      css:.nav-link

*** Test Cases ***
Validate login with email ID from the hyperlink
    Select the link of Child Window
    Verify if user is swtiched to child window
    Grab the Email ID from the child window and grab the email ID
    Fill the form on Parent window

*** Keywords ***

Select the link of Child Window
    click element       css:.blinkingText
    Sleep   5
    Switch Window       NEW

Verify if user is swtiched to child window
    Element Text Should Be      xpath=//h1[normalize-space()='Documents request']      DOCUMENTS REQUEST

Grab the Email ID from the child window and grab the email ID
    ${text}=    Get Text    css:.red
    @{words}=   Split String    ${text}     at
    ${text_split}=      Get From List           ${words}    1
    @{words_email}=   Split String    ${text_split}     with
    ${email_id}=    Get From List   ${words_email}  0
    Set Global Variable     ${email_id}

Fill the form on Parent window
     Switch Window       MAIN
     Sleep      5
     Input Text     id:username     ${email_id}