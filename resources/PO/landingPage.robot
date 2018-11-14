*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGNIN_MAIN_HEADING} =  xpath=//li[@class='ggr-nav-item ggr-nav-item--logo gc-desktop-visible']//a[@class='nav-logo nav-logo--dark'][contains(text(),'Gogoro')]
${LOGIN_BTN} =  xpath=//li[@class='ggr-nav-item ggr-nav-item--secondary ggr-nav-item--login gc-desktop-visible']//a[@class='ggr-nav-link nav-list__link nav-list__link--login nav-list__link--dark'][contains(text(),'登入')]

*** Keywords ***
Load
    Go To  ${START_URL}

Verify Page Loaded
    Page Should Contain Element     ${SIGNIN_MAIN_HEADING}
    Element Text Should Be          ${SIGNIN_MAIN_HEADING}  Gogoro
    Wait Until Element Is Visible   ${LOGIN_BTN}    timeout=30s
    Wait Until Page Contains        登入
