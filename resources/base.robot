*** Settings ***

Documentation    Arquivo base para automação desktop da calculadora

Library     SikuliLibrary

Resource    actions/calculadora.robot

*** Keywords ***

Carrega os elementos da Calculadora
    Add Image Path        ${EXECDIR}${/}resources${/}elements

Inicia Sessão
    Carrega os elementos da Calculadora
    Click    iniciar-windows.png
    Click    calculadora.png

Encerra Sessão
    Stop Remote Server

Finaliza Teste
    Close Application     Calculadora