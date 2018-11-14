*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SINGIN_BTN} =  xpath=//a[@class='btn btn-text-gray right']
${EMAIL_FIELD} =  xpath=//input[@id='email']
${PASSWORD_FIELD} =  xpath=//input[@id='password']
${LOGIN_BTN} =  xpath=//li[@class='ggr-header-item my-gogoro-item']//a[@class='ggr-nav-link nav-list__link nav-list__link--login nav-list__link--dark'][contains(text(),'登入')]

*** Keywords ***
GO TO LOGIN page
    Click Element  ${LOGIN_BTN}

Verify landing LOGIN page
    Wait Until Page Contains        電子信箱
    Page Should Contain Element     ${EMAIL_FIELD}

Login With Credentials
    [Arguments]  ${Username}  ${Password}
    Fill "Email" Field  ${Username}
    Fill "Password" Field  ${Password}

Fill "Email" Field
    [Arguments]  ${Username}
    Input Text  ${EMAIL_FIELD}  ${Username}
    Log  Filling Email field with ${Username}

Fill "Password" Field
    [Arguments]  ${Password}
    Input Text  ${PASSWORD_FIELD}  ${Password}
    Log  Filling Password field with ${Password}

Click "LOGIN" button
    click element   xpath=//span[@class='ladda-label']

Verfiy popup Invalid Email message
    Wait Until Element Is Visible   xpath=//div[@type='danger']//div
    Page Should Contain             此電子信箱不存在

Verfiy popup Invalid Password message
    Wait Until Element Is Visible   xpath=//div[@type='danger']//div
    Page Should Contain             請確認帳號和密碼

Verfiy popup Invalid len Password message
    Wait Until Element Is Visible   xpath=//span[@class='help-block']
    Page Should Contain             請輸入最少8以及最多20個數字的密碼
    sleep                           1.5s

Verfiy LOGIN successful to LOGIN page
    Wait Until Element Is Visible   xpath=//div[@class='layout-cell cell-name hidden-xs hidden-sm topHeader-menuLink']
    Page Should Contain             My Gogoro