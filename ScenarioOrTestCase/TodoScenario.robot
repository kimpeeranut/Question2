*** Settings ***
Resource  ../Common/Common.robot

*** Keywords ***

Finish All To do Task
    maximize browser window
    set selenium timeout  20
    set selenium speed  1
    #Step 1 :  Click menu To do
    Click Single Action   xpath://a[@href='#todo']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
    #Step 2 : Mark as complete
    Click Multiple Action  //*[@id="incomplete-tasks"]//label[@for='_Replace_']//span[@class='mdl-checkbox__ripple-container mdl-js-ripple-effect mdl-ripple--center']  9999


Remove All To do Task
    maximize browser window
    set selenium timeout  20
    set selenium speed  1
    #Step 1 :  Click menu To do
    Click Single Action   xpath://a[@href='#todo']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
    #Step 2 : Mark as complete
    Click Multiple Action   //ul[@id='incomplete-tasks']//button[@id="_Replace_"]   9999

Validate Finish Task was moved to Complete Task Lane
    [Arguments]  ${finishItemName}     ${pathText}
    #log to console  {msg}:${msg}
    #Step 1 :  Click menu To do
    Click Single Action   xpath://a[@href='#completed']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
    #Step 2 : Validate Task Name that was added previously is successful
    ${result}=  Search Text     ${pathText}     ${finishItemName}   50
    should be true  ${result}

Validate To do Task is not Exist when it was deleted
    [Arguments]  ${RemoveTodoItemName}     ${pathText}
    #Step 1 :  Click menu To do
    Click Single Action   xpath://a[@href='#todo']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
    #Step 2 : Validate Task Name that was added previously is successful
    ${result}=  Search Text     ${pathText}     ${RemoveTodoItemName}   50
    should not be true  ${result}


