Feature: Commits

  Scenario: Rebase, squash commits, and force push
    Given I have write permissions to a repository named "AcmeTests"
    And I have created a branch named "new-tests" from the default branch of "AcmeTests"
    And I have pushed multiple commits on the "new-tests" branch to origin
    And I have rebased the "new-tests" branch on the "AcmeTests" default branch
    And I have squashed my commits
    And I have force-pushed my rebased "new-tests" branch
    When I go to /github-username/AcmeTests/commits/new-tests/
    Then I should see one commit
