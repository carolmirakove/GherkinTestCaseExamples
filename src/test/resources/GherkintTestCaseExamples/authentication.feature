Feature: Authentication

  Scenario: Two-factor authentication disabled
    Given my github user account settings have 2FA disabled
    When I sign in with my username and valid password
    Then I should see my homepage feed

  Scenario: Two-factor authentication enabled with SMS
    Given my github security settings have 2FA enabled with SMS/Text message
    When I sign in with my username and valid password
    Then I should be redirected to /sessions/two-factor/sms/confirm
    And I should not be able to access my homepage feed
#    This feature test ends here as its goal is to verify 2FA is enforced in a full-stack context. To verify the full 2FA login sequence, which entails fetching and submitting a valid authentication code, I would develop front-end component tests with mock data to verify the expected sequence when a valid or invalid code is submitted, plus integration tests to verify the authentication API response when a valid or invalid code is submitted.
