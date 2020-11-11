*** Settings ***
Resource    ../resources/get_current_weather.robot
Library     FakerLibrary
Library     JSONSchemaLibrary

Suite Setup   Create API Session


*** Test Cases ***
Check Current Weather by City Name
  [tags]    city_name

  ${city_name}=                     Set Variable                        São Paulo
  ${response}=                      Get Current Weather By City Name    ${city_name}
  Should Be Equal As Strings        ${response.status_code}             200
  Validate Json                     current_weather.schema.json         ${response.json()}
  Dictionary Should Contain Item    ${response.json()}                  name                  ${city_name}


Check Current Weather by non-existent City Name
  [tags]    city_name

  ${city_name}=                     FakerLibrary.Password
  ${response}=                      Get Current Weather By City Name    ${city_name}
  Should Be Equal As Strings        ${response.status_code}             404             
  Validate Json                     current_weather_error.schema.Json   ${response.json()}
  Dictionary Should Contain Item    ${response.json()}                  cod                 404
  Dictionary Should Contain Item    ${response.json()}                  message             city not found


Check Current Weather by Zipcode
  [tags]    zipcode

  &{city}=                          Create Dictionary                 name=Anchorage
  ...                                                                 zipcode=99501
  ${response}=                      Get Current Weather By Zipcode    ${city.zipcode}
  Should Be Equal As Strings        ${response.status_code}           200
  Validate Json                     current_weather.schema.json       ${response.json()}
  Dictionary Should Contain Item    ${response.json()}                name                  ${city.name}


Check Current Weather by Invalid Zipcode
  [tags]    zipcode
  
  ${zipcode}=                       FakerLibrary.Word
  ${response}=                      Get Current Weather By Zipcode      ${zipcode}
  Should Be Equal As Strings        ${response.status_code}             404             
  Validate Json                     current_weather_error.schema.json   ${response.json()}
  Dictionary Should Contain Item    ${response.json()}                  cod                 404
  Dictionary Should Contain Item    ${response.json()}                  message             city not found