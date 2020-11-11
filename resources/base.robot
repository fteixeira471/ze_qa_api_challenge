*** Settings ***
Library   RequestsLibrary
Library   Collections

*** Variables ***
${API_URL}    https://api.openweathermap.org
${API_KEY}    b76f8e09fd83f514fd8f46f9ae456fe1


*** Keywords ***
Create API Session
  Create Session    openWeatherMap    ${API_URL}