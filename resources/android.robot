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

Fechar app
  Close Application
