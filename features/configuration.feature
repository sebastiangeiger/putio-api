Feature: Configuration

  In order to not enter my credentials all the tim
  As a user of putio
  I want the application to read in a configuration file

  Scenario: Configuration file not specified and ~/.putio exists
    Given a configuration file exists in my HOME directory with:
    """
    ---
    :token: ABCDEFG
    """
    When I run `putio config show-all`
    Then the output should contain "token: ABCDEFG"

  Scenario: Configuration file not specified and ~/.putio does not exist
    Given there is no configuration file in my HOME directory
    When I run `putio config show-all`
    Then the output should contain "Please run `putio config init`"

  Scenario: Generating new configuration file
    Given there is no configuration file in my HOME directory
    When I run `putio config init`
    Then the output should contain "Initialized file"
    And the configuration file in my HOME directory says:
    """
    ---
    :token: Enter your token here!
    """
