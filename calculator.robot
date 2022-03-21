*** Settings ***
Library                 AppiumLibrary
Resource                keywords.robot

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     8.1
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          com.android.calculator2
${APP_ACTIVITY}         com.android.calculator2.Calculator

*** Test Cases ***     

Verify Operation Multiply and Divide
    Open Android Application
    Click Calculator Number         number=1
    Click Calculator Number         number=0
    Click Calculator Operation      operation=mul
    Click Calculator Number         number=5
    Click Calculator Operation      operation=mul
    Click Calculator Number         number=4
    Click Calculator Operation      operation=div
    Click Calculator Number         number=8
    Click Calculator Operation      operation=div
    Click Calculator Number         number=5
    Click Other Operation           other=eq
    Element Text Should Be          id=com.android.calculator2:id/result       5

Verify Operation with Comma
    Open Android Application
    Click Calculator Number         number=1
    Click Other Operation           other=dec_point
    Click Calculator Number         number=5
    Click Calculator Operation      operation=mul
    Click Calculator Number         number=2
    Click Other Operation           other=eq
    Element Text Should Be          id=com.android.calculator2:id/result       3

Verify Clear Button Visible
    Open Android Application
    Click Calculator Number             number=1
    Click Calculator Operation          operation=add
    Click Calculator Number             number=2
    Click Other Operation               other=eq
    Wait Until Element Is Visible       id=com.android.calculator2:id/clr
    Page Should Not Contain Element     id=com.android.calculator2:id/del

Verify Operation Sum and Substract
    Open Android Application
    Click Calculator Number         number=1
    Click Calculator Operation      operation=add
    Click Calculator Number         number=2
    Click Calculator Operation      operation=add
    Click Calculator Number         number=3
    Click Calculator Operation      operation=sub
    Click Calculator Number         number=4
    Click Calculator Operation      operation=sub
    Click Calculator Number         number=5
    Click Other Operation           other=eq
    Element Text Should Be          id=com.android.calculator2:id/result       −3 

Verify Delete Button Visible
    Open Android Application
    Page Should Contain Element         id=com.android.calculator2:id/del
    Page Should Not Contain Element     id=com.android.calculator2:id/clr