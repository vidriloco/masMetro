Users want to know that nobody can masquerade as them.  We want to extend trust
only to visitors who present the appropriate credentials.  Everyone wants this
identity verification to be as secure and convenient as possible.

Story: Logging in
  As a non authenticated user with an account
  I want to log in to my account
  So that I can be myself

  #
  # Log in: get form
  #
  Scenario: Any user can get to login page.
    Given no one is logged in
    When I go to pagina de inicio de sesion
    Then I should see "Inicio de Sesión"
    And I should see "Login"
    And I should see "Contraseña"
    
    
  Scenario: Visitor user can login
    Given no one is logged in
    Given It exists "visitor" user with login "insulzo" and password "pelaez"
    When I go to pagina de inicio de sesion
    When I fill in "Login" with "insulzo"
    When I fill in "Contraseña" with "pelaez"
    When I press "Acceder"
    Then I should be on the homepage

  Scenario: Administrator user can login
    Given no one is logged in
    Given It exists "administrator" user with login "insulzo" and password "pelaez"
    When I go to pagina de inicio de sesion
    When I fill in "Login" with "insulzo"
    When I fill in "Contraseña" with "pelaez"
    When I press "Acceder"
    Then I should be on administraciones
    
  Scenario: User can login and then be able to logout
    Given It exists "visitor" user with login "insulzo" and password "pelaez"
    When I go to pagina de inicio de sesion
    When I fill in "Login" with "insulzo"
    When I fill in "Contraseña" with "pelaez"
    When I press "Acceder"
    Then I should be on the homepage
    When I log out
    Then I should be on the homepage
    
