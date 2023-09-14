*** Settings ***
Documentation        Aula da Conie no Webinar da Kwan

Library              SeleniumLibrary
*** Variables ***
${URL_BASE}        https://www.google.com/
${user}            sidnei.moreira.mkt@gmail.com
${pwd}             Vl@.div-71k75

*** Test Cases ***
CT001 :: Login Valido
    Abrir pagina    ${URL_BASE}
    # Aceitar Cookies
    Ir para pagina de Login
    preencher os campos    ${user}    ${pwd}
    Clicar em Login
    Pagina deve conter elemento
*** Keywords ***
Abrir pagina
    [Arguments]    ${URL_BASE}
    Open Browser    ${URL_BASE}    edge
# Aceitar Cookies
#     No Operation
#     Click Button    id=L2AGLb
Ir para pagina de Login
    Click Element        xpath://*[@id="gb"]/div/div[2]/a        #//*[@id="gb"]/div/div[2]/a/span
preencher os campos
    [Arguments]    ${user}    ${pwd}
    Input Text    id=identifierId    ${user}
    Click Element    xpath=//*[@id="identifierNext"]/div/button/span
    Sleep    3s
    Input Text    //*[@id="password"]/div[1]/div/div[1]/input    ${pwd}
    

Clicar em Login
    Click Element    xpath=//*[@id="passwordNext"]/div/button/span
    Sleep    3s

Pagina deve conter elemento
    Page Should Contain    xpath://*[@id="gb"]/div[2]/div[3]/div[1]/div/div[1]/a