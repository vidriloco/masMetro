Feature: Manage Mini-Blogs
  As an administrator
  I want to create, delete, and edit Mini-Blogs
  
  Scenario: administrator sees Mini-Blog configuration page
    Given I have logged in as "administrator"
    And I follow "Mini-Blogs"
    Then I should see "Mini-Blogs"

  Scenario: non administrator cannot see Mini-Blog configuration page
    Given I have logged in as "visitor"
    And I go to Mini-Blogs config page
    Then I should be on pagina de inicio de sesion
    
  Scenario: administrator creates a new Mini-Blog
    Given I have logged in as "administrator"
    When I create a new Mini-Blog with nombre "Prueba" and descripcion "Descripción corta pero útil"
    Then I should be on show Mini-Blog page
    
  Scenario: administrator cannot create a Mini-Blog without a nombre
    Given I have logged in as "administrator"
    When I create a new Mini-Blog with nombre "" and descripcion "Descripción corta pero útil"
    Then I should be on Mini-Blogs config page
    
  Scenario: administrator creates a new Mini-Blog without a descripción
    Given I have logged in as "administrator"
    When I create a new Mini-Blog with nombre "Algo" and descripcion ""
    Then I should be on show Mini-Blog page    
    And I should see "Sin descripción"
    
  Scenario: administrator visit the new Mini-Blog but follows return link
    Given I have logged in as "administrator"
    And I am on Mini-Blogs config page
    When I press "Nuevo"
    Then I should see "Crear Mini-Blog"
    And I follow "Atrás"
    Then I should be on Mini-Blogs config page

  Scenario: after Mini-Blog creation, administrator gets redirected to show Mini-Blog page
    Given I have logged in as "administrator"
    When I create a new Mini-Blog with nombre "Prueba" and descripcion "Descripción corta pero útil"
    Then I should see "Mini-Blog creado exitosamente"
    And I should see "Modificar"
    And I should see "Atrás"
    
  Scenario: administrator is on show Mini-Blog page and goes to edit Mini-Blog page
    Given I have logged in as "administrator"
    When I create a new Mini-Blog with nombre "Prueba" and descripcion "Descripción corta pero útil"
    Then I follow "Modificar"
    And I should be on edit Mini-Blog page
    And I should see "Modificar Mini-Blog"
    
  Scenario: administrator is on edit Mini-Blog page and saves
    Given I have logged in as "administrator"
    When I create a new Mini-Blog with nombre "Prueba" and descripcion "Descripción corta pero útil"
    Then I follow "Modificar"
    And I fill in "Nombre" with "Modificación a Prueba"
    And I press "Guardar"
    Then I should be on show Mini-Blog page
    Then I should see "Mini-Blog actualizado exitosamente"
    
  Scenario: administrator is on edit Mini-Blog page and goes to show
    Given I have logged in as "administrator"
    When I create a new Mini-Blog with nombre "Prueba" and descripcion "Descripción corta pero útil"
    Then I follow "Modificar"
    Then I follow "Vista Previa"
    Then I should be on show Mini-Blog page
    
  Scenario: administrator is on edit Mini-Blog page and goes to show
    Given I have logged in as "administrator"
    When I create a new Mini-Blog with nombre "Prueba" and descripcion "Descripción corta pero útil"
    Then I follow "Modificar"
    Then I follow "Atrás"
    Then I should be on Mini-Blogs config page

  Scenario: administrator visits show Mini-Blog page and there are no entradas for the blog
    Given I have logged in as "administrator"
    Given The following Mini-Blogs are created:
        | nombre  | descripcion |
        | Prueba1 | Una pequeña descripción |
    When I go to Mini-Blogs config page
    When I press "Mostrar"
    Then I should see "Entradas de éste Mini-Blog"
    Then I should see "No hay entradas todavía"
  Scenario: administrador visits show Mini-Blog page and there are some entradas for the blog
    Given I have logged in as "administrator"
    Given I created a entrada for a Mini-Blog
    When I go to Mini-Blogs config page
    When I press "Mostrar"
    Then I should see "Entradas de éste Mini-Blog"
    Then I should see "1 Entrada"
  Scenario: administrador visits show Mini-Blog page and clicks button 'Nueva'
    Given I have logged in as "administrator"
    Given The following Mini-Blogs are created:
        | nombre  | descripcion |
        | Prueba1 | Una pequeña descripción |
    When I go to Mini-Blogs config page
    When I press "Mostrar"
    When I press "Nueva"
    Then I should see "Escribir Nueva Entrada"
    
    