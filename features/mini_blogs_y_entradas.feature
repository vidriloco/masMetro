Feature: Manage Mini-Blogs and Entradas
  As an administrator
  I want to create, edit, delete entradas on Mini-Blogs
  
Scenario: administrator visits Mini-Blogs config page and adds an entrada to one of the Mini-Blogs
    Given I have logged in as "administrator"
    Given The following Mini-Blogs are created:
        | nombre  | descripcion |
        | Prueba1 | Una pequeña descripción |
    When I go to Mini-Blogs config page
    When I press "Mostrar"
    When I press "Nueva"
    When I fill in the following:
        |Título   | Linea 4                          |
        |contenido| Se extenderá hacia acoxpa pronto |
    When I check "Visible"
    When I press "Crear"
    Then I should be on entrada de Mini-Blog page
    And I should see "Entrada creada exitosamente"
    And I should see "Linea 4"
    And I should see "Se extenderá hacia acoxpa pronto"

Scenario: administrator visits Mini-Blogs config page and goes to new entrada page but clicks atrás button
    Given I have logged in as "administrator"
    Given The following Mini-Blogs are created:
        | nombre  | descripcion |
        | Prueba1 | Una pequeña descripción |
    When I go to Mini-Blogs config page
    When I press "Mostrar"
    When I press "Nueva"
    When I follow "Atrás"
    Then I should be on show Mini-Blog page
    
Scenario: administrator visits Mini-Blogs config page and adds an entrada to one of the Mini-Blogs
    Given I have logged in as "administrator"
    Given The following Mini-Blogs are created:
        | nombre  | descripcion |
        | Prueba1 | Una pequeña descripción |
    When I go to Mini-Blogs config page
    When I press "Mostrar"
    When I press "Nueva"
    When I fill in the following:
        |Título   | Linea 4                          |
        |contenido| Se extenderá hacia acoxpa pronto |
    When I check "Visible"
    When I press "Crear"
    Then I should be on entrada de Mini-Blog page
    And I should see "Entrada creada exitosamente"
    And I should see "Linea 4"
    And I should see "Se extenderá hacia acoxpa pronto"
