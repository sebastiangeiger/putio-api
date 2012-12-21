Feature: Download Urls

  In order to be able to download the files on my local machine
  As a user of putio
  I want the application to return the download URLs

  Scenario: Getting the download link to a file without spaces
    Given a valid configuration file exists
    When I run `putio url "Modern.Family.S04E06.720p.HDTV.X264-DIMENSION.mkv"`
    Then the output should be a URL
