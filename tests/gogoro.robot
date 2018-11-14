*** Settings ***
Documentation  gogoro web sanity test
Library  SeleniumLibrary
Resource  ../resources/common.robot
Resource  ../resources/gogoroWebApp.robot

# robot -d results tests/gogoro.robot

*** Variables ***
${BROWSER} =  ff
${START_URL} =  https://www.gogoro.com/tw/
${LOGIN_EMAIL} =  fqoff740818@gmail.com
${LOGIN_PASSWORD} =  yyyy999***
${INVALID_LOGIN_EMAIL} =  fqoff740818@gmail.co
${INVALID_LOGIN_PASSWORD} =  yyyy123+++

*** Test Cases ***
Landing Main Page
    [Documentation]     正確進入Main Page
    [Tags]  smoke LandingMainPage
    common.Begin Web Test
    gogoroWebApp.Verify main page landing successsful

Landing LOGIN Page
    [Documentation]     正確進入Login Page
    [Tags]  smoke Login
    gogoroWebApp.GO TO LOGIN page
    gogoroWebApp.Verify LOGIN page landing successsful

Login with Invalid Email
    [Documentation]     非法Email測試
    [Tags]  smoke Login
    gogoroWebApp.Login with Invalid Email  ${INVALID_LOGIN_EMAIL}  ${INVALID_LOGIN_PASSWORD}
    gogoroWebApp.Verfiy popup Invalid Email message

Login with Invalid Password
    [Documentation]     非法Password測試
    [Tags]  smoke Login
    gogoroWebApp.Login with Invalid Password  ${LOGIN_EMAIL}  ${INVALID_LOGIN_PASSWORD}
    gogoroWebApp.Verfiy popup Invalid Password message

Login with Invalid len Password
    [Documentation]     非法Password格式測試
    [Tags]  smoke Login
    gogoroWebApp.Login with Invalid Password  ${LOGIN_EMAIL}  123
    gogoroWebApp.Verfiy popup Invalid len Password message

Login with Valid Credentials
    [Documentation]     正確登入測試
    [Tags]  smoke Login
    gogoroWebApp.Login with Valid Credentials    ${LOGIN_EMAIL}  ${LOGIN_PASSWORD}
    gogoroWebApp.Verfiy LOGIN successful to LOGIN page
    common.End Web Test

