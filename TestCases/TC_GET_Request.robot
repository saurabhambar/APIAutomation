#ambar
*** Settings ***
Library    RequestsLibrary
Library    Collections
*** Variables ***
${base_url}    http://localhost:8081/
${user_id}     2

*** Test Cases ***

Get_userInfo
    create session    myssion           ${base_url}
    ${response}=      GET On Session    myssion        /users/${user_id}
    # log to console    ${response.status_code}
    # log to console    ${response.content}
    # log to console    ${response.headers}

    #VALIDATIONS
    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}       200

    ${body}=          convert to string    ${response.content}
    should contain    ${body}              2

    ${contentTypeValue}=    get from dictionary    ${response.headers}    content-type
    should be equal         ${contentTypeValue}    application/json