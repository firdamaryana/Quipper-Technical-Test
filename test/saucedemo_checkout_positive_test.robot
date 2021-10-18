*** Settings ***
Documentation           Quipper Technical Test
Resource                ${EXECDIR}/keyword/saucedemo_login.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            saucedemo
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack
Library                 DataDriver  ${EXECDIR}/csv/saucedemo_checkout_positive_test.csv
Test Template           Positive - Complete Order

*** Keywords ***
Positive - Complete Order
     [Arguments]         ${test_desc}		${test_number}    ${test_type}   ${first_name}   ${last_name}  ${postal_code}   ${expected_display}
        GIVEN User opens saucedemo
        AND Checkout - User inputs username and password
        AND User clicks masuk button
        AND User click add to charts
        AND User click trolly button
        AND User click checkout button
        WHEN User inputs firstname lastname and postalcode      ${first_name}   ${last_name}    ${postal_code}
        AND User click continue button
        AND User click Finsih button        ${first_name}   ${last_name}    ${postal_code}
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='0'      THEN Display login page
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='1'      THEN Display login page
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='2'      THEN Display login page
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='3'      THEN Display login page
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='4'      THEN Display login page
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='5'      THEN Display login page
        Run Keyword And Continue On Failure      Run Keyword If           '${test_number}'=='6'      THEN Display login page
        Close Browser

*** Test Cases ***
${test_number}. Complete Order -${test_type}- ${test_desc}   ${first_name}   ${last_name}  ${postal_code}  ${expected_display}