*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    ../Libraries/clashRoyaleAPI.py
Library    ../Libraries/external_ip.py

Resource   variables.robot

*** Keywords ***
Abrir navegador
    Open Browser    ${URL}  ${BROWSER}  options=add_experimental_option("excludeSwitches", ["enable-logging"])
    Maximize Browser Window

Fechar navegador
    Close Browser

# Steps
Acessar o website do Clash Royale
    Log To Console  ${\n} Abrindo o website do Clash Royale
    Abrir navegador
    Title Should Be  Clash Royale API

Clicar no botão login
    Wait Until Element Is Visible  ${LOCATOR_LOGIN}
    Click Element    ${LOCATOR_LOGIN}

Logar com as minhas credenciais
    Log To Console  Logando com as minhas credenciais: ${USER}
    Wait Until Element Is Visible  ${LOCATOR_USER}
    Input Text        ${LOCATOR_USER}  ${USER}
    Input Password    ${LOCATOR_PASSWORD}  ${PASSWORD}
    Click Element     ${LOCATOR_LOGAR}

Acessar o menu Minha Conta
    Wait Until Element Is Visible  ${LOCATOR_MENU}
    Click Element     ${LOCATOR_MENU}
    Click Element     ${LOCATOR_MINHA_CONTA}

Cria uma nova chave
    Log To Console  Criando uma nova chave de acesso
    Wait Until Element Is Visible  ${LOCATOR_NOVA_CHAVE}
    Click Element     ${LOCATOR_NOVA_CHAVE}

    Wait Until Element Is Visible  ${LOCATOR_NOME_CHAVE}
    Input Text  ${LOCATOR_NOME_CHAVE}  testPrimeControl
    Input Text  ${LOCATOR_DESC_CHAVE}  Teste Prime Control
    ${IP}  Get External Ip
    Input Text  ${LOCATOR_IP}  ${IP}
    Click Element  ${LOCATOR_ADD_CHAVE}

Obter e armazenar chave
    Log To Console  Obtendo e armazenando a nova chave de acesso
    Wait Until Element Is Visible  ${LOCATOR_MINHA_CHAVE}
    Click Element  ${LOCATOR_MINHA_CHAVE}

    ${MEU_TOKEN}  Get Text  ${LOCATOR_TOKEN}
    Set Suite Variable  ${MEU_TOKEN}

Deletar minha chave
    Wait Until Element Is Visible  ${LOCATOR_DEL_CHAVE}
    Click Element  ${LOCATOR_DEL_CHAVE}
    Wait Until Page Contains  Key deleted successfully.

Obter clã "${NOME_CLA}" do "${PAÍS}" e tag iniciada em "${PARTIAL_TAG_CLA}"
    Log To Console  ${\n} Removendo arquivo antigo de membros
    Remove File  ${CURDIR}/../informacoes_membros_clan.csv
    Log To Console  Obtendo a tag do clã via integração com a API do Clash Royale
    ${TAG}  Get Tag Clan  ${MEU_TOKEN}  ${NOME_CLA}  ${PARTIAL_TAG_CLA}  ${PAÍS}
    Log To Console  Obtendo os membros do clã via integração com a API do Clash Royale
    Create File Of Clan Members  ${MEU_TOKEN}  ${TAG}
    Log To Console  Fim: Criado arquivo ./informacoes_membros_clan.csv