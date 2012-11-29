Feature: Downloads

  In order to have the files on my local machine
  As a user of putio
  I want the application download selected files

  Scenario: Downloading a small file
    When I run `putio download "Uploading to Piratebay- The Complete Guide.txt"`
    Then the file "Uploading to Piratebay- The Complete Guide.txt" should exist in the current directory
