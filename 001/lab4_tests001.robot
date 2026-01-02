*** Settings ***
Library    SeleniumLibrary
Suite Setup    Launch Registration Page
Suite Teardown    Close Browser

*** Variables ***
${URL}       http://localhost:7272/StarterFiles/Registration.html
${BROWSER}   chrome
${SCREENSHOT_DIR}   D:/ChromeForTesting/TestAutomationLab/screenshots

*** Test Cases ***
Successful Registration With Organization
    [Documentation]    ทดสอบลงทะเบียนสำเร็จ กรอกทุกช่อง
    Open Registration Page
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Capture Page Screenshot    ${SCREENSHOT_DIR}/WithOrganization.png

Successful Registration Without Organization
    [Documentation]    ทดสอบลงทะเบียนสำเร็จ โดยไม่กรอก Organization
    Open Registration Page
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Capture Page Screenshot    ${SCREENSHOT_DIR}/WithoutOrganization.png

*** Keywords ***
Launch Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Open Registration Page
    Go To    ${URL}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Capture Page Screenshot