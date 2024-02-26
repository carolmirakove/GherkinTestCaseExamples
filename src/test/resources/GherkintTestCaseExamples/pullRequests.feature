Feature: Pull Requests

  Scenario: Merge conflicts
    Given two users have write permissions to a repository named "GherkinTestCaseExamples":
      | user   |
      | mel    |
      | carol  |
    And "GherkinTestCaseExamples" includes a file "README.md" with at least one line of code
    And user "mel" has created a branch "readme-update" from the default branch of "GherkinTestCaseExamples"
    And user "carol" has created a branch "readme-updates" from the default branch of "GherkinTestCaseExamples"
    And user "mel" has merged a new commit that changed the first line of "README.md"
    And user "carol" has not merged the latest changes from the default branch of "GherkinTestCaseExamples"
    When user "carol" creates a pull request from the branch "readme-updates" that includes a change to the first line of "README.md"
    Then I should see the "Resolve conflicts" button
    And I should not see the "Merge pull request" button
