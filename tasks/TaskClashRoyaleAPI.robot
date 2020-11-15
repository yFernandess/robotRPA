*** Settings ***
Resource                  ../resources/ResourceClashRoyaleAPI.robot

Suite Teardown  Fechar navegador

*** Tasks ***
Parte 01: Criar chave da API Clash Royale
    Acessar o website do Clash Royale
    Clicar no botão login
    Logar com as minhas credenciais
    Acessar o menu Minha Conta
    Cria uma nova chave
    Obter e armazenar chave

Parte 02: Obter as informações do clã The Resistance
    Obter clã "The Resistance" do "Brazil" e tag iniciada em "#9V2Y"
    Deletar minha chave