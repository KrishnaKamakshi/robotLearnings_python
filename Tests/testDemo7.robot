*** Settings ***
Documentation  File Upload Download in Robot Framework
Library  SeleniumLibrary
Library   OperatingSystem

*** Variables ***

*** Test Cases ***
   
Verify File Download
    [documentation]  This test case verifies that a user can successfully download a file
    [tags]  Regression
    ${chrome options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    ${prefs}  Create Dictionary
    ...  download.default_directory=../Downloads
    Call Method  ${chrome options}  add_experimental_option  prefs  ${prefs}
    Create Webdriver  Chrome  executable_path=D:/rbdrivers/chromedriver.exe     chrome_options=${chrome options}
    Goto  https://the-internet.herokuapp.com/download
    Click Link              xpath://*[@id="content"]/div/a[5]
    Sleep  5s
    ${files}  List Files In Directory  ../Downloads
    Length Should Be  ${files}  1
    Close Browser