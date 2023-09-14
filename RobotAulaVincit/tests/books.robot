*** Settings ***
Resource    ../resources/configs/configs.resource
Resource    ../resources/books.resource

*** Test Cases ***
CT001 :: Inserção de um novo livro
    [Tags]    post
    Begin session
    Inserir um livro com sucesso
    # E insiro um ID de identificação
    # E insiro o Titulo do Livro
    # E insiro a descrição do livro
    # E insiro a quantidade de paginas que contem o livro
    # Então deve criar um novo livro com sucesso em meu banco de dados
    # E seu status code deve ser 200
    # E o response deve conter os valores inseridos