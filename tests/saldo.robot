*** Settings ***
Resource  ../resources/android.robot

Test Setup  Abrir emulador
Test Teardown  Fechar app

*** Test Cases ***
Cenario: Ver saldo
  Aguardar a tela principal
  Click Element  accessibility_id=show-balance
  Element Text Should Be  accessibility_id=user-balance  R$ 5.500,00
