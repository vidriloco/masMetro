Factory.define :entrada do |f|
  f.titulo "Cualquiera"
  f.contenido "Una contenido con ideas que contiene algo que es largo aunque no deberia ser tan tan largo, pues la idea es muy corta, pero la palabrería es muy larga"
  f.visible true
  f.mini_blog {|mb| mb.association(:mini_blog, :nombre => "Palabrerias") }
  f.user {|user| user.association(:user_visitor) }
end