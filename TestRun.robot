*** Settings ***
Library  SeleniumLibrary
Resource  ScenarioOrTestCase/AddItemScenario.robot
Resource  ScenarioOrTestCase/CompleteScenario.robot
Resource  ScenarioOrTestCase/TodoScenario.robot

Test Setup      open browser  https://abhigyank.github.io/To-Do-List/  chrome
Test Teardown   close browser
*** Variables ***
${input}

*** Test Cases ***
# Add Item Flow
Scenario1_Flow
    ${input}=   Add Item    Addscenario1
    set global variable     ${input}
    Validate Item was added     ${input}    //*[@id="text-_Replace_" and text()='_Replace2_']

# Mark To do task as Complete Flow
Scenario2_Flow
    ${input}=   Add Item    Addscenario2
    set global variable     ${input}
    Validate Item was added     ${input}    //*[@id="text-_Replace_" and text()='_Replace2_']
    Finish All To do Task
    Validate Finish Task was moved to Complete Task Lane    ${input}    //*[@id="completed-tasks"]/li[_Replace_]/span[text()='_Replace2_']
    Remove All Completed Task
    Validate Task is not Exist when it was deleted      ${input}    //*[@id="completed-tasks"]/li[_Replace_]/span[text()='_Replace2_']

# Remove To do task Flow
Scenario_3
    ${input}=   Add Item    Addscenario3
    set global variable     ${input}
    Validate Item was added     ${input}    //*[@id="text-_Replace_" and text()='_Replace2_']
    Remove All To do Task
    Validate To do Task is not Exist when it was deleted    ${input}    //*[@id="text-_Replace_" and text()='_Replace2_']


