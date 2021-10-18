*** Settings ***
Documentation           Quipper Technical Test
Resource                ${EXECDIR}/keyword/saucedemo_login.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            saucedemo
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/saucedemo_login_positive_test.csv
Test Template           Positive - Login Saucedemo

*** Keywords ***
Positive - Login Saucedemo
     [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${username}   ${password}  ${expected_display}
        GIVEN User opens saucedemo
        WHEN User inputs username and password      ${username}       ${password}
        AND User clicks masuk button
        Run Keyword And Continue On Failure      Run Keyword If           '${test_type}'=='P'      THEN dashboard swaglabs will be displayed
        Close Browser

*** Test Cases ***
${test_number}. Login Saucedemo -${test_type}- ${test_desc}   ${username}   ${password}  ${expected_display}