*** Settings ***

Documentation    Keywords responsáveis pelos testes das suites

Library    SikuliLibrary
Library    String

*** Keywords ***

Soma Simples
    [Arguments]    ${primeiro-num}    ${segundo-num}
    
    Click    ${primeiro-num}.png
    Click    op-adicao.png
    Click    ${segundo-num}.png    
    Click    op-igual.png
    Capture Screen
    Apagar Cálculo

Subtração Simples
    [Arguments]    ${primeiro-num}    ${segundo-num}
    
    Click    ${primeiro-num}.png
    Click    op-subtracao.png
    Click    ${segundo-num}.png    
    Click    op-igual.png
    Capture Screen
    Apagar Cálculo

Multiplicação Simples
    [Arguments]    ${primeiro-num}    ${segundo-num}
    
    Click    ${primeiro-num}.png
    Click    op-multiplicacao.png
    Click    ${segundo-num}.png    
    Click    op-igual.png
    Capture Screen
    Apagar Cálculo

Divisão Simples
    [Arguments]    ${primeiro-num}    ${segundo-num}
    
    Click    ${primeiro-num}.png
    Click    op-divisao.png
    Click    ${segundo-num}.png    
    Click    op-igual.png
    Capture Screen
    Apagar Cálculo
    
Percentual Simples
    [Arguments]    ${primeiro-num}    ${segundo-num}
    
    Click    ${primeiro-num}.png
    Click    op-adicao.png
    Click    ${segundo-num}.png    
    Click    op-percentual.png
    Click    op-igual.png
    Capture Screen
    Apagar Cálculo

Digitar Numero 
    [Arguments]    ${numero}
    ${txt}=    Convert To String    ${numero}
    ${txt}=    Evaluate    str(r'''${txt}''').strip()
    @{chars}=  Evaluate    list(str(r'''${txt}'''))
    FOR    ${c}    IN    @{chars}
        Run Keyword If    '${c}' in '0123456789'      Click    num-${c}.png
        ...    ELSE IF    '${c}'=='.' or '${c}'==','  Click    virgula.png
        ...    ELSE IF    '${c}'=='-'                 Click    op-subtracao.png
        ...    ELSE                                   Fail     Caractere inesperado no número: '${c}'
    END

Digitar Operador
    [Arguments]    ${op}
    Run Keyword If    '${op}' in ['+','mais']         Click    op-adicao.png
    ...    ELSE IF    '${op}' in ['-','menos']        Click    op-subtracao.png
    ...    ELSE IF    '${op}' in ['*','x','×']        Click    op-multiplicacao.png
    ...    ELSE IF    '${op}' in ['/','÷',':']        Click    op-divisao.png
    ...    ELSE IF    '${op}' in ['percentual','%']   Click    op-percentual.png
    ...    ELSE IF    '${op}'=='='                    Click    op-igual.png
    ...    ELSE                                       Fail     Operador '${op}' não mapeado (adicione a imagem correspondente).

Calcular Expressao
    [Arguments]    @{tokens}
    FOR    ${t}    IN    @{tokens}
        ${tstr}=    Convert To String    ${t}
        ${tstr}=    Evaluate    str(r'''${tstr}''').strip()
        Run Keyword If    '${tstr}'==''    Continue For Loop
        ${isnum}=    Evaluate    __import__('re').match(r'^-?\\d+(?:[.,]\\d+)?$', r'''${tstr}''') is not None
        Run Keyword If    ${isnum}    Digitar Numero                  ${tstr}
        ...    ELSE                   Digitar Operador                ${tstr}
    END
    Click    op-igual.png
    Apagar Cálculo

Apagar Cálculo
    Click    apagar-calculo.png


