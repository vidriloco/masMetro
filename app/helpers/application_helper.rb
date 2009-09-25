# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Método auxiliar que hace disponibles a las instancias de mini-blog en el template application.html.erb
  def lista_de_mini_blogs
    MiniBlog.find(:all)
  end  
  
  # Método auxiliar a nivel template para decidir que mostrar a los usuarios que son administrador
  def logeado_administrador?
    current_user && current_user.es_administrador?
  end
end
