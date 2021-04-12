#ambar
***Settings***
Library    RequestsLibrary
Library    Collections

***Variables***
${base_url}=    http://localhost:8081/
${user_id}      2

***Test Cases***
Put_CustomerRegistration

    create session    myssion              ${base_url}
    ${body}=          create dictionary    id=6                             name=Aman    phone=22222142    email=aman@company.com    address=Chennai, Tamil Nadu, India    country=India    department=T21R
    ${header}=        create dictionary    Content-Type=application/json
    ${response}=      post request         myssion                          /users       data=${body}      headers=${header}

    log to console    ${response.status_code}
    log to console    ${response.content}

    #VALIDATIONS

    ${status_code}=    convert to string    ${response.status_code}
    should be equal    ${status_code}       200

    # ${res_body}=  convert to string  ${response.content}
    # should contain  ${res_body}  OPERATION_SUCCESS
    # should contain  ${res_body}  Opertaion completed successfully


