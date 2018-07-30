Feature: Site loading

  @test
  Scenario: User got on main page
    Given I open a browser
    When I enter the side url
    Then  I verify main page is loaded