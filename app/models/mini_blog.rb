class MiniBlog < ActiveRecord::Base
  
  has_many :entradas
  
  validates_presence_of :nombre, :message => "no puede ser vacío"
  
  # Método que 'humaniza' la nulidad en el valor del atributo descripcion de éste modelo
  def descripcion_
    return "Sin descripción" if descripcion.blank?
    descripcion
  end
end
