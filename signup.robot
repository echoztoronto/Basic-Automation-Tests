*** Settings ***
Documentation       test
Library             SeleniumLibrary
Library             String
Suite Teardown      Close Browser

*** Variables ***
${LOGIN URL}        https://anime-qa-forum.herokuapp.com/
${BROWSER}          Chrome
${navSignup}        id:signup-btn
${usernameField}    id:sign_username
${pwdField1}        id:sign_pwd1
${pwdField2}        id:sign_pwd2
${signupBtn}        xpath://*[@id="signup-container"]/div[3]/button
${loggedUserIcon}   id:nav_user_profile
 
*** Test Cases ***
Valid SignUp
    [tags]    basic
    Open Browser To Home Page
    Wait Until Element Is Visible        ${navSignup}           10s
    Click Element                        ${navSignup}
    Input random username and password          
    Click Element                        ${signupBtn}
    Wait Until Page Contains Element     ${loggedUserIcon}      2s
    Page Should Contain Image            ${loggedUserIcon}

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Input random username and password 
    ${username} =  Generate Random String    10
    ${password} =  Generate Random String    10
    Wait Until Element Is Visible        ${usernameField}      2s
    Input Text                           ${usernameField}      ${username}
    Input Text                           ${pwdField1}          ${password}
    Input Text                           ${pwdField2}          ${password}
    