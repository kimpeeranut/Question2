
*** Settings ***
Resource  ../Common/Common.robot

*** Keywords ***

Remove Specific Completed Task
    [Arguments]  ${targetRemoveCompletedTask}
    maximize browser window
    set selenium timeout  20
    set selenium speed  1
    #Step 1 :  Click menu To do
    Click Single Action   ${targetRemoveCompletedTask}

Remove All Completed Task
    maximize browser window
    set selenium timeout  20
    set selenium speed  1
    #Step 1 :  Click menu To do
    Click Single Action   xpath://a[@href='#completed']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
    #Step 2 : Remove as complete
    Click Multiple Action   //ul[@id='completed-tasks']//button[@id="_Replace_"]    99999

Validate Task is not Exist when it was deleted
    [Arguments]  ${RemoveItemName}     ${pathText}
    #Step 1 :  Click menu To do
    Click Single Action   xpath://a[@href='#completed']//span[@class='mdl-tabs__ripple-container mdl-js-ripple-effect']
    #Step 2 : Validate Task Name that was added previously is successful
    ${result}=  Search Text     ${pathText}     ${RemoveItemName}   50
    should not be true  ${result}

