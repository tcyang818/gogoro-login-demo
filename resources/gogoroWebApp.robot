*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/PO/landingPage.robot
Resource  ../resources/PO/signIn.robot
*** Variables ***

*** Keywords ***
Verify main page landing successsful
    landingPage.Load
    landingPage.Verify Page Loaded

GO TO LOGIN page
    signIn.GO TO LOGIN page

Verify LOGIN page landing successsful
    signIn.Verify landing LOGIN page

Login with Invalid Email
    [Arguments]  ${Username}  ${Password}
    signIn.Login With Credentials    ${Username}  ${Password}
    signIn.Click "LOGIN" button

Login with Invalid Password
    [Arguments]  ${Username}  ${Password}
    signIn.Login With Credentials    ${Username}  ${Password}
    signIn.Click "LOGIN" button

Verfiy popup Invalid Email message
    signIn.Verfiy popup Invalid Email message

Verfiy popup Invalid Password message
    signIn.Verfiy popup Invalid Password message

Verfiy popup Invalid len Password message
    signIn.Verfiy popup Invalid len Password message

Login with Valid Credentials
    [Arguments]  ${Username}  ${Password}
    signIn.Login With Credentials    ${Username}  ${Password}
    signIn.Click "LOGIN" button

Verfiy LOGIN successful to LOGIN page
    signIn.Verfiy LOGIN successful to LOGIN page


