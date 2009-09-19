Feature: Register user
  As a non logged in user
  I want to be able to register in the application
  
  Scenario: user gets registered as visitor user
    When I go to Usuarios registration page
    Then I should see "Registrarse como un usuario nuevo"
    Then I should see "Nombre"
    Then I should see "Login"
    Then I should see "Email"
    Then I should see "Contraseña"
    Then I should see "Confirmación de Contraseña"
    When I fill in the following:
        | user_name                    | Jose Perez        | 
        | user_login                   | jose_perez        | 
        | user_email                   | josep@example.com | 
        | user_password                | j_contrasena      | 
        | user_password_confirmation   | j_contrasena      |
    When I press "Guardar"
    Then I should see "Has sido registrado en éste sitio. Gracias por interesarte en el STC Metro."
    
  Scenario: user gets registered as administrator user when providing registration password
    When I go to Usuarios admin registration page
    Then I should see "Registrarse como un usuario nuevo"
    Then I should see "Nombre"
    Then I should see "Login"
    Then I should see "Email"
    Then I should see "Contraseña"
    Then I should see "Confirmación de Contraseña"
    Then I should see "Clave de Registro"
    When I enter all the needed data together with the registration password
    When I press "Guardar"
    Then I should see "Has sido registrado en éste sitio como un administrador. Gracias por interesarte en el STC Metro."
    
  Scenario: user does not get registered as administrator when providing empty password
    When I go to Usuarios admin registration page
    Then I should see "Registrarse como un usuario nuevo"
    Then I should see "Nombre"
    Then I should see "Login"
    Then I should see "Email"
    Then I should see "Contraseña"
    Then I should see "Confirmación de Contraseña"
    Then I should see "Clave de Registro"
    When I enter all the needed data except the registration password
    When I press "Guardar"
    Then I should be on Usuarios create page
    