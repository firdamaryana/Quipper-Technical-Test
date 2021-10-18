*** Settings ***
Documentation           Quipper Technical Test
Resource                ${EXECDIR}/keyword/saucedemo_login.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            saucedemo
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/saucedemo_checkout_negative_test.csv
Test Template           Negative - Checkout Information

*** Keywords ***
Negative - Checkout Information
     [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${first_name}   ${last_name}  ${postal_code}   ${expected_display}
        GIVEN User opens saucedemo
        AND Checkout - User inputs username and password
        AND User clicks masuk button
        AND User click add to charts
        AND User click trolly button
        AND User click checkout button
        WHEN User inputs firstname lastname and postalcode      ${first_name}   ${last_name}    ${postal_code}
        AND User click continue button
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='0'      THEN display warning message firstname lastname and postalcode      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='1'      THEN display warning message firstname lastname and postalcode      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='2'      THEN display warning message firstname lastname and postalcode      ${expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='3'      THEN display warning message firstname lastname and postalcode      ${expected_display}
        Close Browser

*** Test Cases ***
${test_number}. Checkout -${test_type}- ${test_desc}   ${first_name}   ${last_name}  ${postal_code}  ${expected_display}