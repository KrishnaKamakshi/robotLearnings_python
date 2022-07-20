*** Settings ***
Library     Collections
Library     RequestsLibrary






*** Test Cases ***
Play around with Dictionaries concepts
    [Tags]      API
    &{data}=    create dictionary       name=Krishna Kamaksh Brahma     course=robot        website=https://udemy.com/course
    log     ${data}[website]
    ${url}=     get from dictionary     ${data}     website
    &{request_body}  create dictionary       name=pythonOnlineCourse     isbn=324543        aisle=12345
    POST        ${url}/Library/Addbook.php     json=${request_body}        expected_status=400