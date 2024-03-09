Feature: Generate token

  Background:
    * url "https://restful-booker.herokuapp.com"

  @token
  Scenario: Obtain authentication token
    Given path "/auth"
    And request { "username": "admin", "password": "password123" }
    When method post
    Then status 200
    And match response.token != null
    * print response.token

