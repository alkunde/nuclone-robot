*** Settings ***
Resource  ../resources/android.robot

Test Setup  Abrir app
Test Teardown  Fechar app

*** Test Cases ***
Cenario: Escolher favorecido
  Wait Until Page Contains Element  accessibility_id=card-hero  10
  Swipe By Percent  93  90  50  90  1000
  Click Text  Transferir
  Wait Until Page Contains  Transferir para um novo contato  10
  Input Text  xpath=//android.widget.EditText[contains(@text, 'Buscar Contato')]  Tony Stark
  ${contacts}  Get Matching Xpath Count  xpath=//android.widget.ScrollView[@content-desc="contacts"]/android.view.ViewGroup/android.view.ViewGroup
  Should Be Equal  1  ${contacts}