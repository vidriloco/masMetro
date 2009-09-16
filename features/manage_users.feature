Feature: Manage Users
  As an administrator
  I want to review the user status of this application
  
  Scenario: administrator access User management page
    Given I have logged in as "administrator"
    And I follow "Usuarios"
    Then I should be on Usuarios config page

  Scenario: non administrator cannot see Mini-Blog configuration page
    Given I have logged in as "visitor"
    And I go to Usuarios config page
    Then I should be on pagina de inicio de sesion

  Scenario: administrator sess on User management page
    Given I have logged in as "administrator"
    And I follow "Usuarios"
    And I should see "Usuarios"
    And I should see "Contraseña de Registro"
        
  Scenario: administrator generates new registration password
    Given I have logged in as "administrator"
    And I go to Usuarios config page
    When I press "Generar"
    Then I should see "Contraseña de Registro: "
    Then I should see "La contraseña de registro ha sido renovada"
    And I should see "Regresar"
    When I follow "Regresar"
    Then I should be on Usuarios config page
    
  Scenario: administrator sees already generated password
    Given I have logged in as "administrator"
    And I go to Usuarios config page
    When I press "Mostrar"
    Then I should see "Contraseña de Registro: "    
    And I should see "Regresar"
    When I follow "Regresar"
    Then I should be on Usuarios config page
         
    