*** Settings ***
Documentation    Casos de teste elaborados para resolver as questoes da prova do quarto semestre referente a automacao de testes utilizando robot
Resource         testes_amazon_resources.robot
Test Setup       Abrir o Navegador
Test Teardown    Fechar o Navegador

*** Test Cases ***
Caso de teste 01 - Preencher formulario
        [Documentation]        Esse caso de teste preenche o formulario de cadastro da amazon
        Abrir o formulario de cadastro da amazon
        Preencher o formulario de cadastro
        Registrar Resultados
        Enviar formulario

Caso de Teste 02 - Buscar produto no site da Amazon
        [Documentation]        esse caso de teste busca por um produto na amazon e acessa os dois primeiros resultados
        Abrir o site da Amazon
        Buscar produto
        Visualizar resultados
        Verificar se os resultados correspondem a busca
        Acessar primeiro resultado
        Voltar para resultados de busca
        Acessar o segundo resultado