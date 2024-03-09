Feature: List a book

  Background:
    * url "https://restful-booker.herokuapp.com"

  @create-book
  Scenario: List a book
    Given path '/booking'
    When method get
    Then status 200