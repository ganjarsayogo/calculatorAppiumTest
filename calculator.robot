*** Settings ***
Library                 AppiumLibrary

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     8.1
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          com.android.calculator2
${APP_ACTIVITY}         com.android.calculator2.Calculator

*** Test Cases ***
Test 1
    Open Android Application
    Click Calculator Number         number=4
    Click Calculator Operation      operation=plus
    Click Calculator Number         number=6
    Click Calculator Operation      operation=equals
    Element Attribute Should Match  com.android.calculator2:id/result       text        10
    #Tap 4
    #Tap +
    #Tap 6
    #Tap =
    #Verify result

*** Keywords ***
Open Android Application
    Open Application            ${REMOTE_URL}	
    ...                         platformName=${PLATFORM_NAME}
    ...                         platformVersion=${PLATFORM_VERSION}
    ...                         deviceName=${DEVICE_NAME}
    ...                         appPackage=${APP_PACKAGE}
    ...                         appActivity=${APP_ACTIVITY}

Click Calculator Number
    [Arguments]                 ${number}
    Click Element               //android.widget.LinearLayout[@content-desc="Numbers and basic operations"]/android.view.ViewGroup[1]/android.widget.Button[${number}]

Click Calculator Operation             
    [Arguments]                 ${operation}
    Click Element               //android.widget.Button[@content-desc="${operation}"]