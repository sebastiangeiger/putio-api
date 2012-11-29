Feature: Listing Files and Directories

  In order to see what's available
  As a user of putio
  I want to list all files in a given path

  Scenario: Listing files in root
    Given a valid configuration file exists
    When I run `putio list /`
    Then the output should contain "The.Walking.Dead.S03E07.720p.HDTV.x264-EVOLVE.mkv"
