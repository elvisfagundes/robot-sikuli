*** Settings ***

Documentation    Suite de testes de calculos

Resource          ${EXECDIR}${/}resources${/}base.robot

Suite Setup       Inicia Sessão
Suite Teardown    Encerra Sessão

*** Test Cases ***

Realizar cálculos simples
    Soma Simples             num-1    num-3
    Subtração Simples        num-2    num-5
    Multiplicação Simples    num-4    num-6
    Divisão Simples          num-7    num-8
    Percentual Simples       num-9    num-2 

Realizar cálculos complexos
    Calcular Expressao     200    +    10    *    2
    Calcular Expressao     200    /    10    *    2
    Calcular Expressao     100    -    15    %    
    Calcular Expressao     10000.123    +    1242,230
    Finaliza Teste