class GenPassword < ActiveRecord::Base

  def initialize
    super
    self.password=generate_random
  end
  
  def self.create
    gpasswd=self.new
    # Limpia contraseña anterior antes de escribir una nueva
    self.destroy_all
    gpasswd.save!
    return gpasswd
  end
  
  # @author: Andrew Pociu (http://www.geekpedia.com/author1_Andrew-Pociu.html)
  # This piece of code generates a random password of the specified length, but mixes the two sets of letters so that a pronouncable password is being generated.
  def generate_random(size = 4)
    c = %w(b c d f g h j k l m n p qu r s t v w x z ch cr fr nd ng nk nt ph pr rd sh sl sp st th tr lt)
    v = %w(a e i o u y)
    f, r = true, ''
    (size * 2).times do
      r << (f ? c[rand * c.size] : v[rand * v.size])
      f = !f
    end
    r
  end
  
  # Método que decide si es necesario una renovación en la contraseña
  def self.need_renewal?
    today = Date.today
    self.first.updated_at <= today.months_ago(1)
  end
end

