*** Settings ***
Documentation           Quipper Technical Test
Resource                ${EXECDIR}/keyword/saucedemo_login.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            saucedemo
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/saucedemo_login_negative_test.csv
Test Template           Negative - Login Saucedemo

*** Keywords ***
Negative - Login Saucedemo
    [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${username}   ${password}  ${expected_display}
        GIVEN User opens saucedemo
        WHEN User inputs username and password      ${username}       ${password}
        AND User clicks masuk button
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='0'      THEN display warning message username and password      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='1'      THEN display warning message username and password      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='2'      THEN display warning message username and password      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='3'      THEN display warning message username and password      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='4'      THEN display warning message username and password      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='5'      THEN display warning message username and password      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='6'      THEN display warning message username and password      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='7'      THEN display warning message username and password      ${expected_display}
        Close Browser

*** Test Cases ***
${test_number}. Login Saucedemo -${test_type}- ${test_desc}   ${username}   ${password}  ${expected_display}