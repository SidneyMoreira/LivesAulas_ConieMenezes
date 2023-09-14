*** Settings ***
Documentation       Teste utilizando a API FakerRestApi Webinar Kwan com a Conie

Library             RequestsLibrary
Library             JSONLibrary
Library             Collections


*** Variables ***
${URL_Base}     https://fakerestapi.azurewebsites.net/api
${id}           ${00000075}
${userName}     Sidney
${password}     1233545


*** Test Cases ***
Cadastrar um usuario
    Begin Session
    Cadastrar um usuario com sucesso
    Buscar o usuario com sucesso


*** Keywords ***
Begin Session
    Create Session    ROBOTAULAKWAN    ${URL_Base}    verify=${True}

Cadastrar um usuario com sucesso
    # ler o payload
    ${user_payload}=    Load Json From File    ./Services/user_payload.json
    Set To Dictionary    ${user_payload}    id=${id}
    Set To Dictionary    ${user_payload}    userName=${userName}
    Set To Dictionary    ${user_payload}    password=${password}

    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST    ${URL_Base}/v1/Users    json=${user_payload}    headers=${headers}    expected_status=200

Buscar o usuario com sucesso
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${response}=    GET    ${URL_Base}/v1/Users    headers=${headers}    expected_status=200
    Log    ${response.json()}