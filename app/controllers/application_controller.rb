# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  # Método auxiliar utilizado como filtro (before_filter) para proteger a las acciones de ciertos controladores de
  # usuarios no permitidos de ejecutarlas
  def es_administrador?
    if logged_in?
      user=User.find(current_user)
      redirect_to(:back) && return unless user
      current_user
    else
      redirect_to(login_path)
    end
  end
end
