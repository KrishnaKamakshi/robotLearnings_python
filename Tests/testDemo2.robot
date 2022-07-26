# Demo for Robot Framework Tests

*** Settings ***
Documentation   To Validate the login form
Library     SeleniumLibrary
Library     Collections
Test Setup      Open the browser with the Payment URL
#Test Teardown       Close Browser Session
Resource        resource.robot

*** Variables ***
${error_message_login}      css:.alert-danger
${message_login}        Incorrect username/password.
${nav_tes}      css:.nav-link

*** Test Cases ***
Validate invalid successful login into the application
    Fill the login form     ${user_name}     ${password_invalid}
    Wait for the error message is displayed

Validate Cards display in the shopping Page
     Fill the login form        ${user_name}        ${valid_password}
     Wait for the checkout message is displayed     ${nav_tes}
     Verify the card details present in the shopping page
     Click on some card details on Shopping Page        ${cardName}

Navigate to the URl and navigate to child window
     Do fill the form with user selection type as "User" and click on the URl provided on the Page

*** Keywords ***

Fill the login form
    [arguments]     ${username}     ${password}
    Input Text      id:username     ${username}
    Input Text      id:password     ${password}
    click button    signInBtn

Wait for the checkout message is displayed
    [arguments]     ${nav_tes}
    Wait Until Element Is Visible      ${nav_tes}
    ${result}=  Get Text    ${nav_tes}

Wait for the error message is displayed
    Wait Until Element Is Visible      ${error_message_login}
    ${result}=  Get Text    ${error_message_login}
    Should Be Equal As Strings  ${result}   ${message_login}

Verify the card details present in the shopping page
    @{expected_list}=  Create List     iphone X        Samsung Note 8       Nokia Edge     Blackberry
    ${result} =    get webelements      css:.card-title
    @{actual_list}=     Create List
    FOR  ${element}  IN      @{result}
          Log   ${element.text}
          Append To List        ${actual_list}      ${element.text}
    END
    Log     ${actual_list}
    list should contain sub list        ${expected_list}       ${actual_list}

Click on some card details on Shopping Page
     [arguments]     ${card_name}
     ${result} =   Get WebElements      css:.card-title
     ${index} =    Set Variable     1
        FOR  ${element}  IN      @{result}
                Exit For Loop If    '${card_name}' == '${element.text}'
                        ${index}=   Evaluate    ${index}+1
        END
     Click Button       xpath:(//*[@class='card-footer'])[${index}]/button

Do fill the form with user selection type as "User" and click on the URl provided on the Page

    Input Text      id:username         krishnakamakshi
    Input Text      id:password         1234567
    Click Element   css:input[value='user']
    Wait Until Element Is Visible   css:.modal-body
    Click Element   okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    Select From List By Value   css:select.form-control     teach
    Select Checkbox     terms
    Checkbox should be Selected     terms