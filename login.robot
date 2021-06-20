*** Settings ***
Documentation       test
Library             SeleniumLibrary
Library             Collections
Suite Teardown      Close Browser

*** Variables ***
${LOGIN URL}        https://anime-qa-forum.herokuapp.com/
${BROWSER}          Chrome
${navLogin}         id:login-btn
${usernameField}    id:login_username
${pwdField}         id:login_pwd
${loginBtn}         xpath://*[@id="login-container"]/div[3]/button
${loggedUserIcon}   id:nav_user_profile


${adminUsername}          admin
${adminPassword}          admin

@{usernames}       admin    user     kano
@{passwords}       admin    user     kano 
 
*** Test Cases ***
Valid Login
    [tags]    basic
    Open Browser To Home Page
    Wait Until Element Is Visible        ${navLogin}           10s
    Click Element                        ${navLogin}
    #Input username and password          ${adminUsername}      ${adminPassword}
    Input random username and password
    Click Element                        ${loginBtn}
    Wait Until Page Contains Element     ${loggedUserIcon}      2s
    Page Should Contain Image            ${loggedUserIcon}


*** Keywords ***
Open Browser To Home Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Input username and password 
    [Arguments]   ${username}    ${password}
    Wait Until Element Is Visible        ${usernameField}      2s
    Input Text                           ${usernameField}      ${username}
    Input Text                           ${pwdField}           ${password}

Input random username and password
    ${index} =  Evaluate    random.randint(0,2)
    ${x} =	Get From List	${usernames}	${index}
    ${y} =  Get From List	${passwords}	${index}
    Wait Until Element Is Visible        ${usernameField}      2s
    Input Text                           ${usernameField}      ${x}
    Input Text                           ${pwdField}           ${y}
    sleep    3s


