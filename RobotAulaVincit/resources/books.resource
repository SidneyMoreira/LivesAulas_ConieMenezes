*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     JSONLibrary
Library     Collections
Library     String
Resource    ../resources/configs/configs.resource
Resource    ../tests/books.robot


*** Variables ***
#${id}               ${13}
${title}            Automacao com Robot
${description}      Aprendendo Teste Automatizados em Robot
${pageCount}        ${300}
${excerpt}          nada
${publishDate}      2023-07-12T05:22:29.408Z


*** Keywords ***
Inserir um livro com sucesso
    ${random_id}    Generate Random String    4    123456789
    ${random_id}    Convert To Integer    ${random_id}
    Set Global Variable    ${random_id}
    ${headers}    Create Dictionary    content-type=application/json
    ${payload_books}    Load Json From File    resources/services/payload_books.json
    # E insiro um ID de identificação
    Set To Dictionary    ${payload_books}    id    ${random_id}
    # E insiro o Titulo do Livro
    Set To Dictionary    ${payload_books}    title    ${title}
    # E insiro a descrição do livro
    Set To Dictionary    ${payload_books}    description    ${description}
    # E insiro a quantidade de paginas que contem o livro
    Set To Dictionary    ${payload_books}    pageCount    ${pageCount}
    Set To Dictionary    ${payload_books}    excerpt    ${excerpt}
    Set To Dictionary    ${payload_books}    publishDate    ${publishDate}
    # Então deve criar um novo livro com sucesso em meu banco de dados
    # E seu status code deve ser 200
    # E o response deve conter os valores inseridos
    ${response}    POST    ${URL_BASE}/Books    json=${payload_books}    headers=${headers}    expected_status=200
