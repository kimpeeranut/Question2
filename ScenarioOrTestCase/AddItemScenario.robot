*** Settings ***
Resource  ../Common/Common.robot

*** Keywords ***
Add Item
    [Arguments]  ${input}
    maximize browser window
    set selenium timeout  20
    set selenium speed  1
    #Step 1 :  Click menu Add item
    Click Single Action   xpath://a[@href='#add-item']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
    #Step 2 :  input text
    wait until page contains element    xpath://input[@class='mdl-textfield__input']
    input text  xpath://input[@class='mdl-textfield__input']     ${input}
    #Step 3 : Click add button
    Click Single Action     xpath://button[@class='mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored']
    return from keyword  ${input}

Validate Item was added
    [Arguments]  ${newItemName}     ${pathText}
    #Step 1 :  Click menu To do
    Click Single Action   xpath://a[@href='#todo']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
    #Step 2 : Validate Task Name that was added previously is successful
    ${result}=  Search Text     ${pathText}     ${newItemName}   50
    should be true  ${result}


