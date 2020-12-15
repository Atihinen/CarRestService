# create folder called robot under CarRestService
# create index.robot file under robot folder
*** Settings ***
Library    REST    ${URL}

*** Variables ***
${URL}    http://localhost:8080

*** Test Cases ***

Calling REST service index should return 200
    [Documentation]    run with command: robot robot/index.robot
    Create GET request to REST Index
    Verify Response Status Code Is 200

Calling REST service index should return object with links to other endpoints
    Verify cars Endpoint Exists In Index
    Verify profile Endpoint Exists In Index


*** Keywords ***

Create GET request to REST Index
    GET    /

Verify Response Status Code Is 200
    Integer    response status    200

Verify cars Endpoint Exists In Index
    String    response body _links cars href    ${URL}/cars

Verify profile Endpoint Exists In Index
    String    response body _links profile href    ${URL}/profile

