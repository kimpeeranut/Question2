*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${xpath}

*** Keywords ***

# Click menu Action
Click Single Action
    [Arguments]    ${pathItem}
    wait until page contains element    ${pathItem}
    click element  ${pathItem}

Click Multiple Action
    [Arguments]    ${pathPatterns}     ${iteration}
    FOR  ${value}    IN RANGE   1  ${iteration}
        ${index}=   convert to string  ${value}
        ${string}=  replace string  ${pathPatterns}    _Replace_     ${index}
        log to console  ${string}
        ${count}=    get element count      ${string}
        Exit For Loop IF    "${count}" == "0"
        Run Keyword If  "${count}" == "1"    Click Single Action  ${string}
    END

Search Text
    [Arguments]   ${pathPatterns}     ${expectedValue}   ${iteration}
    set selenium speed  2
    set selenium timeout  5
    ${value}=   set variable  1
    ${value}=   convert to integer  ${value}
    FOR  ${value}    IN RANGE   1  ${iteration}
        ${index}=   convert to string  ${value}
        ${string}=  replace string  ${pathPatterns}    _Replace_     ${index}
        ${string}=  replace string  ${string}    _Replace2_     ${expectedValue}
        ${count_target} =   Get Element Count   ${string}
        ${result}=  Evaluate   "${count_target}" == "1"
        Exit For Loop IF    "${result}" == "True"
    END
    return from keyword  ${result}

Validate Text
    [Arguments]  ${pathTextItem}    ${expectedValue}
    wait until page contains element    ${pathTextItem}
    ${actualValue} =   get text  ${pathTextItem}
    should contain    ${expectedValue}    ${actualValue}









