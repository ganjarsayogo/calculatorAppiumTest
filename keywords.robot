*** Settings ***
Library                             AppiumLibrary

*** Keywords ***
Open Browser Chrome
    Open Browser                    browser=chrome
    Maximize Browser Window

Open Android Application
    Open Application            ${REMOTE_URL}   
    ...                         platformName=${PLATFORM_NAME}
    ...                         platformVersion=${PLATFORM_VERSION}
    ...                         deviceName=${DEVICE_NAME}
    ...                         appPackage=${APP_PACKAGE}
    ...                         appActivity=${APP_ACTIVITY}

Click Calculator Number
    [Arguments]                         ${number}
    Wait Until Page Contains Element    id=com.android.calculator2:id/digit_${number}       5seconds
    Click Element                       id=com.android.calculator2:id/digit_${number}

Click Calculator Operation             
    [Arguments]                         ${operation}
    Wait Until Page Contains Element    id=com.android.calculator2:id/op_${operation}       5seconds
    Click Element                       id=com.android.calculator2:id/op_${operation}

Click Other Operation             
    [Arguments]                 ${other}
    Click Element               id=com.android.calculator2:id/${other}