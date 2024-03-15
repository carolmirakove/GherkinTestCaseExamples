Feature: Commits

  # Commit history is a central feature of git and GitHub.
  # The following is an example scenario of expected behavior.
  # This scenario should not be implemented as an end-to-end test,
  # because the UI is merely displaying the commits returned by the API.
  # This scenario should instead be tested closer to the application logic
  # as an integration test.
  Scenario: Rebase, squash commits, and force push
    Given I have write permissions to a repository named "AcmeTests"
    And I have created a branch named "new-tests" from the default branch of "AcmeTests"
    And I have pushed multiple commits on the "new-tests" branch to origin
    And I have rebased the "new-tests" branch on the "AcmeTests" default branch
    And I have squashed my commits
    And I have force-pushed my rebased "new-tests" branch
    When I go to /github-username/AcmeTests/commits/new-tests/
    Then I should see one commit
