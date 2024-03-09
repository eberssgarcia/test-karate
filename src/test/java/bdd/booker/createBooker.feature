Feature: Create a book

  Background:
    * url "https://restful-booker.herokuapp.com"
    
  @create-book
  Scenario: Create a book
    Given path '/booking'
    And header Content-Type = "application/json"
    And request
    """
    {
      "firstname": "Sally",
      "lastname": "Brown",
      "totalprice": 111,
      "depositpaid": true,
      "additionalneeds": "Breakfast",
      "bookingdates": {
        "checkin": "2013-02-23",
        "checkout": "2014-10-23"
      }
    }
    """
    When method post
    Then status 200
    And print response
