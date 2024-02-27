Feature: Authorization

  Scenario Outline: Repository visibility
    Given an organization named "Acme" exists
    And "Acme" has a private repository named "AcmeTests" that is visible only to its members
    And the following users exist:
      | user   | organization |
      | mel    | "Acme"       |
      | carol  | ""           |
    And I am authenticated as <user>
    When I navigate to the "AcmeTests" repository
    Then I should see <page>
    Examples:
      | user  | page |
      | mel   | "AcmeTests" repository |
      | carol | github 404 page       |
