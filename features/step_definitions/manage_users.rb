Given /^I have created some users$/ do
  Factory.create(:user_administrator, :login => "pelaez", :email => "pelaez@example.com")
  Factory.create(:user_visitor)
end

Given /^There is no registration password generated$/ do
  GenPassword.destroy_all
end

Given /^There is a registration password generated$/ do
  GenPassword.create
end

