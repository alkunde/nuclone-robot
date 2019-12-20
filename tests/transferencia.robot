*** Settings ***
Resource  ../resources/android.robot

Test Setup  Abrir emulador
Test Teardown  Fechar app

*** Test Cases ***
Cenario: Escolher favorecido
  Aguardar a tela principal
  Acesso a tela de transferencia
  Filtrar o favorecido "Tony Stark"
  Deve retornar somente "1" registro