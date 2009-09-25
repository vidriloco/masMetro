Factory.define :user_administrator, :class => :user do |f|
  f.name "Insulzo Pelaéz"
  f.login "insulzo"
  f.email "insul@example.com"
  f.password_confirmation "monstruo"
  f.password "monstruo"
  f.rol "ADMINISTRADOR"
  f.temporal false
end

Factory.define :user_visitor, :class => :user do |f|
  f.name "Porfirio Gumaro"
  f.login "porqis"
  f.email "p_gumaro@example.com"
  f.password_confirmation "juanito"
  f.password "juanito"
  f.rol "VISITANTE"
  f.temporal false
end