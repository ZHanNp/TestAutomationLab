*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Registration Page
Suite Teardown    Close Browser

*** Variables ***
${URL}       http://localhost:7272/StarterFiles/Registration.html
${BROWSER}   chrome
${SCREENSHOT_DIR}   D:/ChromeForTesting/TestAutomationLab/screenshots

*** Test Cases ***

Open Registration Page
    [Documentation]    เปิดหน้า Workshop Registration
    Go To    ${URL}
    Title Should Be    Registration
    Page Should Contain    Workshop Registration
    Capture Page Screenshot

Empty First Name
    [Documentation]    ทดสอบไม่กรอก First Name
    Go To    ${URL}
    Input Text    id=lastname      Sodyod
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Page Should Contain    Please enter your first name!!
	Capture Page Screenshot    ${SCREENSHOT_DIR}/EmptyFirstName.png

Empty Last Name
    [Documentation]    ทดสอบไม่กรอก Last Name
    Go To    ${URL}
    Input Text    id=firstname     Somyod
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Page Should Contain    Please enter your last name!!
	Capture Page Screenshot    ${SCREENSHOT_DIR}/EmptyLastName.png

Empty First And Last Name
    [Documentation]    ทดสอบไม่กรอก First Name และ Last Name
    Go To    ${URL}
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Page Should Contain    Please enter your name!!
    Capture Page Screenshot    ${SCREENSHOT_DIR}/EmptyFirstAndLastName.png

Empty Email
    [Documentation]    ทดสอบไม่กรอก Email
    Go To    ${URL}
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=phone         091-001-1234
    Click Button  id=registerButton
    Page Should Contain    Please enter your email!!
    Capture Page Screenshot    ${SCREENSHOT_DIR}/EmptyEmail.png

Empty Phone
    [Documentation]    ทดสอบไม่กรอก Phone Number
    Go To    ${URL}
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Click Button  id=registerButton
    Page Should Contain    Please enter your phone number!!
    Capture Page Screenshot    ${SCREENSHOT_DIR}/EmptyPhone.png

Invalid Phone Number
    [Documentation]    ทดสอบกรอก Phone Number ไม่ถูกต้อง
    Go To    ${URL}
    Input Text    id=firstname     Somyod
    Input Text    id=lastname      Sodsai
    Input Text    id=organization  CS KKU
    Input Text    id=email         somyod@kkumail.com
    Input Text    id=phone         1234
    Click Button  id=registerButton
    Page Should Contain    Please enter a valid phone number
    Capture Page Screenshot    ${SCREENSHOT_DIR}/InvalidPhone.png

*** Keywords ***
Open Browser To Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
