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
    Given There is a registration password generated
    When I press "Mostrar"
    Then I should see "Contraseña de Registro: " 
    Then I should see "Generada: "   
    And I should see "Regresar"
    When I follow "Regresar"
    Then I should be on Usuarios config page
    
  Scenario: administrator does not see a not yet generated password, instead he/she sees a message
    Given I have logged in as "administrator"
    And I go to Usuarios config page
    Given There is no registration password generated
    When I press "Mostrar"
    Then I should see "Contraseña de Registro: " 
    Then I should see "No ha sido generada"   
    And I should see "Regresar"
    When I follow "Regresar"
    Then I should be on Usuarios config page
    
  Scenario: administrator sees a listing incluiding all kind of users
    Given I have logged in as "administrator"
    Given I have created some users
    And I go to Usuarios config page
    Then I should see "Nombre"
    And I should see "Login"
    And I should see "Email"
    And I should see "Rol"
    And I should see "VISITANTE"
    And I should see "ADMINISTRADOR"
    
  Scenario: administrator sees a password generation related date message
    Given I have logged in as "administrator"
    Given There is no registration password generated
    And I go to Usuarios config page
    Then I should see "No ha sido generada"
    
  Scenario: administrator sees a password generation related date message
    Given I have logged in as "administrator"
    Given There is a registration password generated
    And I go to Usuarios config page
    Then I should see "Generada:"