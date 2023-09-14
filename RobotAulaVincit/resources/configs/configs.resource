
*** Settings ***
Library    RequestsLibrary
*** Variables ***
${URL_BASE}    https://fakerestapi.azurewebsites.net/api/v1

*** Keywords ***

Begin session
    Create Session    QACulture    ${URL_BASE}    verify=True