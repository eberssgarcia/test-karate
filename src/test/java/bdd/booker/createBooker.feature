Feature: Create a book

  Background:
    * url "https://jsonplaceholder.typicode.com"

  @create-book
  Scenario: Create a book
    Given path '/posts'
    And header Content-Type = "application/json"
    And request
    """
    {
  "id": 101,
  "title": "foo",
  "body": "bar",
  "userId": 1
}
    """
    When method post
    Then status 201
    And print response
