Feature: Manage site
    As an administrator 
    I want to be able to see the configuration options
    
Scenario: administrator tries to access administrator page
    Given I have logged in as "administrator"
    Then I should be on administraciones
    And I should see "¡Estás dentro!"
    And I should see "Mini-Blogs"
    And I should see "Usuarios"
    
Scenario: non administrator tries to access administrator page
    Given I have logged in as "visitor"
    Then I should be on pagina de inicio de sesion
    And I should see "Nombre de usuario ó Contraseña incorrectos"
