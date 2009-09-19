Given /^I am administrator$/ do
  Factory.create(:user_administrator, :login => "insulzo", :password => "insulzo_pelaez", :password_confirmation => "insulzo_pelaez")
end

Given /^I am not an administrator$/ do
  Factory.create(:user_visitor, :login => "porfirio", :password => "porfirio_gumaro", :password_confirmation => "porfirio_gumaro")
end

Given /^It exists "(.*)" user with login "(.*)" and password "(.*)"$/ do |user, login, password|
  if user.eql? 'visitor'
    Factory.create(:user_visitor, :login => login, :password => password, :password_confirmation => password)
  elsif user.eql? 'administrator'
    Factory.create(:user_administrator, :login => login, :password => password, :password_confirmation => password)
  end
end

Given /^I visit iniciar_sesion$/ do
  get 'iniciar_sesion'
end

Given /^I have logged in as "([^\"]*)"$/ do |arg|
  Given 'I visit iniciar_sesion'
  if arg.eql?('administrator')
    And 'I am administrator'
  elsif arg.eql?('visitor')
    And 'I am not an administrator'
  end
  When 'I fill in "login" with "insulzo"'
  And 'I fill in "password" with "insulzo_pelaez"'
  And 'I press "Acceder"'
end