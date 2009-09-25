class Entrada < ActiveRecord::Base
  belongs_to :mini_blog
  belongs_to :user
  
  validates_presence_of :titulo
  
  # Método que 'humaniza' el valor booleano del atributo visible de éste modelo
  def visible_
    visible ? "Sí" : "No"
  end
end
