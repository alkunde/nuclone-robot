*** Settings ***
Library  AppiumLibrary
Library  String

*** Variables ***
${REMOTE_URL}  http://localhost:4723/wd/hub
${APP}  ${CURDIR}/app/nubank.apk

*** Keywords ***
#### Setup e Teardown
Abrir app
  Open Application  ${REMOTE_URL}  platformName=Android  deviceName=device  udid=FBAZB601E146  app=${APP}  automationName=uiautomator2  autoGrantPermissions=true

Abrir emulador
  Open Application  ${REMOTE_URL}  platformName=Android  deviceName=device  udid=emulator-5554  app=${APP}  automationName=uiautomator2  autoGrantPermissions=true

Fechar app
  Capture Page Screenshot
  Close Application

#### Steps
Aguardar a tela principal
  Wait Until Page Contains Element  accessibility_id=card-hero  10

Acesso a tela de transferencia
  Swipe By Percent  93  90  50  90  1000
  Click Text  Transferir
  Wait Until Page Contains  Transferir para um novo contato  10
  Capture Page Screenshot

Filtrar o favorecido "${nome}"
  Input Text  xpath=//android.widget.EditText[contains(@text, 'Buscar Contato')]  ${nome}
  Capture Page Screenshot

Deve retornar somente "${qtd}" registro
  ${contacts}  Get Matching Xpath Count  xpath=//android.widget.ScrollView[@content-desc="contacts"]/android.view.ViewGroup/android.view.ViewGroup
  Should Be Equal  ${qtd}  ${contacts}
  Capture Page Screenshot