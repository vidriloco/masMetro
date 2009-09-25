When /^I create a new Mini-Blog with nombre "(.*)" and descripcion "(.*)"$/ do |nombre, descripcion|
  And 'I am on Mini-Blogs config page'
  When 'I press "Nuevo"'
  Then 'I should see "Crear Mini-Blog"'
  And "I fill in \"Nombre\" with \"#{nombre}\"" unless nombre.blank?
  And "I fill in \"Descripción\" with \"#{descripcion}\"" unless descripcion.blank?
  And 'I press "Crear"'
end

Given /^The following Mini\-Blogs are created:$/ do |table|
  table.hashes.each do |h|
    MiniBlog.create(:nombre => h[:nombre], :descripcion => h[:descripcion])
  end
  p "Numero de blogs:#{MiniBlog.count}"
end

Given /^I created a entrada for a Mini\-Blog$/ do
  Factory.create(:entrada)
end
