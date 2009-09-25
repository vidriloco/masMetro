class EntradasController < ApplicationController
  
  uses_tiny_mce :options => {
                                :theme => 'advanced',
                                :theme_advanced_resizing => true,
                                :theme_advanced_resize_horizontal => false,
                                :plugins => %w{ table fullscreen }
                              }
  
  before_filter :get_mini_blog
  
  def get_mini_blog
    @mini_blog = MiniBlog.find(params[:mini_blog_id])
  end
  
  # GET /entradas
  # GET /entradas.xml
  def index
    @entradas = @mini_blog.entradas.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entradas }
    end
  end

  # GET /entradas/1
  # GET /entradas/1.xml
  def show
    @entrada = @mini_blog.entradas.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entrada }
    end
  end

  # GET /entradas/new
  # GET /entradas/new.xml
  def new
    @entrada = @mini_blog.entradas.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entrada }
    end
  end

  # GET /entradas/1/edit
  def edit
    @entrada = @mini_blog.entradas.find(params[:id])
  end

  # POST /entradas
  # POST /entradas.xml
  def create
    @entrada = @mini_blog.entradas.new(params[:entrada].merge(:user_id => current_user.id))
    
    respond_to do |format|
      if @entrada.save
        flash[:notice] = 'Entrada creada exitosamente'
        format.html { redirect_to([@mini_blog, @entrada]) }
        format.xml  { render :xml => @entrada, :status => :created, :location => [@mini_blog, @entrada] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entrada.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entradas/1
  # PUT /entradas/1.xml
  def update
    @entrada = @mini_blog.entradas.find(params[:id])

    respond_to do |format|
      if @entrada.update_attributes(params[:entrada])
        flash[:notice] = 'Entrada actualizada exitosamente'
        format.html { redirect_to([@mini_blog, @entrada]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entrada.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entradas/1
  # DELETE /entradas/1.xml
  def destroy
    @entrada = @mini_blog.entradas.find(params[:id])
    @entrada.destroy

    respond_to do |format|
      format.html { redirect_to(mini_blog_path(@mini_blog)) }
      format.xml  { head :ok }
    end
  end
end
