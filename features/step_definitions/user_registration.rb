When /^I enter all the needed data together with the registration password$/ do
  fill_in "user_name", :with => "Martinico Paez Valenzuela"
  fill_in "user_login", :with => "mpaezva"
  fill_in "user_password", :with => "barbadosbermuda"
  fill_in "user_password_confirmation", :with => "barbadosbermuda" 
  fill_in "user_email", :with => "mpaez_b@example.com"
  gp = GenPassword.create
  fill_in "clave_de_registro", :with => gp.password
end

When /^I enter all the needed data except the registration password$/ do
  fill_in "user_name", :with => "Martinico Paez"
  fill_in "user_login", :with => "mpaez"
  fill_in "user_password", :with => "barbados"
  fill_in "user_password_confirmation", :with => "barbados" 
  fill_in "user_email", :with => "mpaez@example.com"
end