Feature: Listing Files and Directories

  In order to see what's available
  As a user of putio
  I want to list all files in a given path

  Scenario: Listing files in root
    Given a valid configuration file exists
    When I run `putio list /`
    Then the output should contain "Modern.Family.S04E06.720p.HDTV.X264-DIMENSION.mkv"

  Scenario: Listing files in folder with space
    Given a valid configuration file exists
    When I run `putio list "Modern.Family.S04E07.720p.HDTV.X264-DIMENSION [PublicHD]"`
    Then the output should contain "Modern.Family.S04E07.720p.HDTV.X264-DIMENSION.mkv"
