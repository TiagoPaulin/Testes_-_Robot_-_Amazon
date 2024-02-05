*** Settings ***
Library        SeleniumLibrary
*** Variables ***
${BROWSER}                       chrome
${URL}                           https://www.amazon.com.br/ap/register?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com.br%2F%3F_encoding%3DUTF8%26ref_%3Dnav_newcust&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=brflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0
${LOCATOR_NAME}                  id:ap_customer_name
${NOME}                          Tiago Paulin
${LOCATOR_EMAIL}                 id:ap_email
${EMAIL}                         tiago.paulin@gmail.com
${LOCATOR_PASSWORD}              id:ap_password
${LOCATOR_PASSWORD_CHECK}        id:ap_password_check
${SENHA}                         Minhasenha@123
${LOCATOR_SUBMIT}                id:continue
${URL2}		                 https://www.amazon.com.br
${LOCATOR_BUSCA}	         id:twotabsearchtextbox	
${PRODUTO}		         The Witcher
${LOCATOR_SUBMIT_BUSCA}          id:nav-search-submit-button
${RESULTADO_1}		         //div[@data-cel-widget="search_result_1"]
${TITULO1_DO_PRODUTO}            //span[@class="a-size-base-plus a-color-base a-text-normal"]
${RESULTADO_2}                   //div[@data-cel-widget="search_result_2"]
*** Keywords ***
Abrir o navegador
        Open Browser      browser=${BROWSER}
        Maximize Browser Window

Fechar o navegador 
        Close Browser

Abrir o formulario de cadastro da amazon
        Go To             ${URL}

Preencher o formulario de cadastro
        Capture Page Screenshot
        Input Text        ${LOCATOR_NAME}              ${NOME}
        Sleep    1s
        Input Text        ${LOCATOR_EMAIL}             ${EMAIL}
        Sleep    1s
        Input Password    ${LOCATOR_PASSWORD}          ${SENHA}
        Sleep    1s
        Input Password    ${LOCATOR_PASSWORD_CHECK}    ${SENHA}
        Sleep    1s

Registrar Resultados
        Capture Page Screenshot
        Sleep    2s

Enviar formulario
        Click Element     ${LOCATOR_SUBMIT}
        Sleep    2s


Abrir o site da Amazon
        Go To                               ${URL}

Buscar produto
        Capture Page Screenshot
        Input text                          ${LOCATOR_BUSCA}            ${PRODUTO}
        Capture Page Screenshot
        Click Element                       ${LOCATOR_SUBMIT_BUSCA}

Visualizar resultados
        Wait Until Element Is Visible       ${RESULTADO_2}
        Capture Page Screenshot

Verificar se os resultados correspondem a busca
        ${VERIFICAR}        Get Text        ${TITULO1_DO_PRODUTO}
        Should Contain                      ${VERIFICAR}                ${PRODUTO}

Acessar primeiro resultado
        Click Element                       ${RESULTADO_1}
        Sleep        3s
        Capture Page Screenshot

Voltar para resultados de busca
        Click Element                       ${LOCATOR_SUBMIT_BUSCA}
        Visualizar resultados

Acessar o segundo resultado
        Click Element                       ${RESULTADO_2}
        Sleep         3s
        Capture Page Screenshot