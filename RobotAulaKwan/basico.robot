*** Settings ***
Documentation        Aula da Conie no Webinar da Kwan

Library              SeleniumLibrary
*** Variables ***
${URL_BASE}        www.google.com
${condicao}        ${True}

*** Test Cases ***
CT001 :: Login Valido
    Abrir pagina
    preencher os campos

CT002 :: Exemplo de comando
    Sample For
    Sample IF

CT003 :: Exemplo Run Keyword If
    Verificar condicao


*** Keywords ***
Abrir pagina
    Open Browser    ${URL_BASE}    Chrome
preencher os campos
    No Operation
Sample For
    ${contador}    Set Variable    0
    FOR    ${index}    IN RANGE    5
        ${contador}=    Evaluate    ${contador}+1
        Log To Console    \nIndice: ${index} Contador: ${contador}
    END

Sample IF
    ${idade}    Set Variable    18
    ${message}    Run Keyword If    ${idade}>=18  
    ...  Set Variable  
    ...  Voce é maior de idade    
    ...  ELSE    
    ...  Set Variable    
    ...  Voce é menor de idade.
    Log To Console    ${message}

Verificar condicao
    Run Keyword If    ${condicao}   Log To Console    A condicao foi aceita
    ...  ELSE
    ...    Log To Console    condicao não aceita
    
       