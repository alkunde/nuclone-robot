*** Settings ***
Resource  ../resources/android.robot

Test Setup  Abrir app
Test Teardown  Fechar app

*** Test Cases ***
Cenario: Ver saldo
  Wait Until Page Contains Element  accessibility_id=card-hero  10
  Click Element  accessibility_id=show-balance
  Element Text Should Be  accessibility_id=user-balance  R$ 5.500,00
