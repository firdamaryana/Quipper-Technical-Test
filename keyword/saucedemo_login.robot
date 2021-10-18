*** Settings ***
Documentation           Quipper Technical Test
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot

*** Variables ***
#Login page
${txt_username}=                    id:user-name
${txt_password}=                    id:password
${btn_login}=                       id:login-button
${warning_login}=                   xpath=//div[@class='error-message-container error']

#dashboard page
${dashboard_page}=                          id:inventory_container
${btn_add_to_chart_labs_bike_light}=        id:add-to-cart-sauce-labs-bike-light
${btn_add_to_chart_labs_backpack}=          id:add-to-cart-sauce-labs-backpack
${btn_add_to_chart_labs_bolt_tshirt}=       id:add-to-cart-sauce-labs-bolt-t-shirt
${btn_add_to_chart_labs_fleece_jacket}=     id:add-to-cart-sauce-labs-fleece-jacket
${btn_trolly}                               xpath=//a[@class='shopping_cart_link']
${btn_filter}                               xpath=//select[@class='product_sort_container']
${select_filter_high_price}                 xpath=//option[@value='hilo'][contains(text(),'Price (high to low)')]
${select_filter_low_price}                  xpath=//option[@value='lohi'][contains(text(),'Price (low to high)')]
${select_filter_descending}                 xpath=//option[@value='za'][contains(text(),'Name (Z to A)')]
${select_filter_ascending}                  xpath=//option[@value='az'][contains(text(),'Name (A to Z)')]

#sidebar dashboard
${btn_sidebar}                              id:react-burger-menu-btn
${btn_logout}                               id:logout_sidebar_link
${btn_all_items}                            id:inventory_sidebar_link
${btn_reset_app_state}                      id:reset_sidebar_link
${btn_about}                                id:about_sidebar_link
${btn_close}                                id:react-burger-cross-btn

#your cart page
${cart_page}=                               id:contents_wrapper
${btn_checkout}=                            id:checkout
${btn_continue_shoppung}=                   id:continue-shopping
${btn_remove_labs_bike_light}=              id:remove-sauce-labs-bike-light
${btn_remove_labs_backpack}=                id:remove-sauce-labs-backpack
${btn_remove_labs_bolt_tshirt}              id:remove-sauce-labs-bolt-t-shirt

#checkout page
${checkout_page}=                   id:checkout_info_container
${txt_first_name}=                  id:first-name
${txt_last_name}=                   id:last-name
${txt_zip_code}=                    id:postal-code
${btn_continue}=                    id:continue
${btn_cancel}=                      id:cancel
${warning_checkout}=                xpath=//div[@class='error-message-container error']

#checkout overview page
${checkout_overview_page}           xpath=//span[@class='title'][contains(text(),'Checkout: Overview')]
${btn_finish}=                      id:finish

#checkout complete page
${checkout_complete_page}           id:checkout_complete_container

*** Keywords ***
GENERAL - Login Saucedemo
    [Arguments]         ${txt_username}       ${txt_password}
    Given User opens saucedemo
    When User inputs username and password     ${txt_username}       ${txt_password}
    And User clicks masuk button
    And the dashboard will be displayed

User opens saucedemo
    SeleniumLibrary.Open Browser         https://www.saucedemo.com/       browser=Chrome
    Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_username}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_password}

User inputs username and password
    [Arguments]         ${username}       ${password}
    Login - Input Username             ${username}
    Login - Input Password             ${password}

Login - Input Username
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_username}         ${input}

Login - Input Password
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_password}         ${input}

User clicks masuk button
    SeleniumLibrary.Click Button       ${btn_login}

Display warning message username and password
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_login_text}         SeleniumLibrary.Get Text       ${warning_login}
    Should Be Equal As Strings    ${warning_login_text}          ${expected_display}

Dashboard swaglabs will be displayed
    SeleniumLibrary.Wait Until Element Is Visible       ${dashboard_page}

User click add to charts
    SeleniumLibrary.Click Element                       ${btn_add_to_chart_labs_bike_light}
    SeleniumLibrary.Click Element                       ${btn_add_to_chart_labs_backpack}
    SeleniumLibrary.Click Element                       ${btn_add_to_chart_labs_bolt_tshirt}
    SeleniumLibrary.Click Element                       ${btn_remove_labs_bike_light}
    SeleniumLibrary.Click Element                       ${btn_sidebar}
    SeleniumLibrary.Wait Until Element Is Visible       ${btn_reset_app_state}
    SeleniumLibrary.Click Element                       ${btn_reset_app_state}
    SeleniumLibrary.Click Element                       ${btn_all_items}
    SeleniumLibrary.Click Element                       ${btn_close}
    SeleniumLibrary.Click Element                       ${btn_add_to_chart_labs_bike_light}
    SeleniumLibrary.Click Element                       ${btn_add_to_chart_labs_fleece_jacket}
    SeleniumLibrary.Click Element                       ${btn_filter}
    SeleniumLibrary.Click Element                       ${select_filter_high_price}
    SeleniumLibrary.Click Element                       ${btn_filter}
    SeleniumLibrary.Click Element                       ${select_filter_low_price}
    SeleniumLibrary.Click Element                       ${btn_filter}
    SeleniumLibrary.Click Element                       ${select_filter_ascending}
    SeleniumLibrary.Click Element                       ${btn_filter}
    SeleniumLibrary.Click Element                       ${select_filter_descending}

User click trolly button
    SeleniumLibrary.Click Element                       ${btn_trolly}
    SeleniumLibrary.Wait Until Element Is Visible       ${cart_page}

User click checkout button
    SeleniumLibrary.Click Element                       ${btn_remove_labs_bike_light}
    SeleniumLibrary.Click Element                       ${btn_continue_shoppung}
    SeleniumLibrary.Click Element                       ${btn_trolly}
    SeleniumLibrary.Click Element                       ${btn_checkout}
    SeleniumLibrary.Wait Until Element Is Visible       ${checkout_page}

User inputs firstname lastname and postalcode
    [Arguments]         ${first_name}       ${last_name}    ${postal_code}
    SeleniumLibrary.Click Element             ${btn_cancel}
    SeleniumLibrary.Click Element             ${btn_checkout}
    Checkout - Input First Name               ${first_name}
    Checkout - Input Last Name                ${last_name}
    Checkout - Input Postal Code              ${postal_code}

Checkout - Input First Name
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_first_name}         ${input}

Checkout - Input Last Name
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_last_name}          ${input}

Checkout - Input Postal Code
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_zip_code}           ${input}

User click continue button
    SeleniumLibrary.Click Element                       ${btn_continue}

Checkout - User inputs username and password
    SeleniumLibrary.Input Text          id:user-name                standard_user
    SeleniumLibrary.Input Text          id:password                 secret_sauce

Display warning message firstname lastname and postalcode
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_checkout_text}      SeleniumLibrary.Get Text          ${warning_checkout}
    Should Be Equal As Strings    ${warning_checkout_text}          ${expected_display}

User click Finsih button
    [Arguments]         ${first_name}       ${last_name}    ${postal_code}
    SeleniumLibrary.Click Element                       ${btn_cancel}
    SeleniumLibrary.Click Element                       ${btn_trolly}
    SeleniumLibrary.Click Element                       ${btn_checkout}
    Checkout - Input First Name                         ${first_name}
    Checkout - Input Last Name                          ${last_name}
    Checkout - Input Postal Code                        ${postal_code}
    SeleniumLibrary.Click Element                       ${btn_continue}
    SeleniumLibrary.Wait Until Element Is Visible       ${checkout_overview_page}
    SeleniumLibrary.Scroll Element Into View            ${btn_finish}
    SeleniumLibrary.Click Element                       ${btn_finish}
# complete order
    SeleniumLibrary.Wait Until Element Is Visible       ${checkout_complete_page}
    SeleniumLibrary.Click Element                       ${btn_sidebar}
    SeleniumLibrary.Wait Until Element Is Visible       ${btn_logout}
    SeleniumLibrary.Click Element                       ${btn_logout}

Display login page
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_username}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_password}