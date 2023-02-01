Feature: People
  Scenario: There is CSV file with people data
    Given I visit the Galactic Directory page
    When I upload a file
    Then I should see the list of valid people
    And I should not see the invalid people

