class AdministracionesController < ApplicationController
  
  before_filter :es_administrador?
  
  # GET /administraciones
  # GET /administraciones.xml
  def index
  end

  # GET /administraciones/1
  # GET /administraciones/1.xml
  def show
    @administraciones = Administraciones.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @administraciones }
    end
  end

  # GET /administraciones/new
  # GET /administraciones/new.xml
  def new
    @administraciones = Administraciones.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @administraciones }
    end
  end

  # GET /administraciones/1/edit
  def edit
    @administraciones = Administraciones.find(params[:id])
  end

  # POST /administraciones
  # POST /administraciones.xml
  def create
    @administraciones = Administraciones.new(params[:administraciones])

    respond_to do |format|
      if @administraciones.save
        flash[:notice] = 'Administraciones was successfully created.'
        format.html { redirect_to(@administraciones) }
        format.xml  { render :xml => @administraciones, :status => :created, :location => @administraciones }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @administraciones.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /administraciones/1
  # PUT /administraciones/1.xml
  def update
    @administraciones = Administraciones.find(params[:id])

    respond_to do |format|
      if @administraciones.update_attributes(params[:administraciones])
        flash[:notice] = 'Administraciones was successfully updated.'
        format.html { redirect_to(@administraciones) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @administraciones.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /administraciones/1
  # DELETE /administraciones/1.xml
  def destroy
    @administraciones = Administraciones.find(params[:id])
    @administraciones.destroy

    respond_to do |format|
      format.html { redirect_to(administraciones_url) }
      format.xml  { head :ok }
    end
  end
  
  
  # POST /generate
  # Método que genera una nueva contraseña de registro
  def registration_password
    if request.post?
      @genpassword = GenPassword.create
      flash[:notice] = "La contraseña de registro ha sido renovada" 
    end
    @genpassword = GenPassword.find(:first) if request.get?
  
    respond_to do |format|
      format.html 
      format.js 
    end
  end
  
end
