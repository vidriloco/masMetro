class UsersController < ApplicationController

  before_filter :es_administrador?, :only => [:index]

  # render new.rhtml
  def new
    @user = User.new(:rol => "VISITANTE")
  end
  
  def new_admin
    @user = User.new(:rol => "ADMINISTRADOR")
  end
 
  def create
    logout_keeping_session!
    @user = User.new_(params[:user], params[:clave_de_registro])
    success = @user && @user.errors.empty?
    if success && @user.save
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      if @user.es_administrador?
        flash[:notice] = "Has sido registrado en éste sitio como un administrador. Gracias por interesarte en el STC Metro."
      elsif @user.es_visitante?
        flash[:notice] = "Has sido registrado en éste sitio. Gracias por interesarte en el STC Metro."
      end
      redirect_back_or_default('/')
      
    else
      render(:template => 'users/new_admin') if @user.es_administrador?   
      render(:template => 'users/new') if @user.es_visitante?
    end
  end
  
  def index
    @users = User.find(:all)
    @estado = GenPassword.password_creation_status
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
end
