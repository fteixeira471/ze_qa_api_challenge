*** Settings ***
Documentation   https://openweathermap.org/current
Resource        ../resources/base.robot

*** Variables ***
${uri}    /data/2.5/weather

*** Keywords ***
Get Current Weather By City Name
  [Arguments]   ${city_name}

  &{params}=    Create Dictionary   q=${city_name}
  ...                               appid=${API_KEY}

  ${response}=    Get Request   openWeatherMap
  ...                           ${uri}
  ...                           params=${params}

  [Return]        ${response}


Get Current Weather By Zipcode
  [Arguments]   ${zipcode}

  &{params}=    Create Dictionary   zip=${zipcode}
  ...                               appid=${API_KEY}

  ${response}=    Get Request   openWeatherMap
  ...                           ${uri}
  ...                           params=${params}
  
  [Return]        ${response}