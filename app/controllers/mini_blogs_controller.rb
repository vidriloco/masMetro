class MiniBlogsController < ApplicationController
  
  before_filter :es_administrador?, :except => :show
  
  
  # GET /mini_blogs
  # GET /mini_blogs.xml
  def index
    @mini_blogs = MiniBlog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mini_blogs }
    end
  end

  # GET /mini_blogs/1
  # GET /mini_blogs/1.xml
  def show
    @mini_blog = MiniBlog.find(params[:id])
    @entradas = @mini_blog.entradas
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mini_blog }
    end
  end

  # GET /mini_blogs/new
  # GET /mini_blogs/new.xml
  def new
    @mini_blog = MiniBlog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mini_blog }
    end
  end

  # GET /mini_blogs/1/edit
  def edit
    @mini_blog = MiniBlog.find(params[:id])
  end

  # POST /mini_blogs
  # POST /mini_blogs.xml
  def create
    @mini_blog = MiniBlog.new(params[:mini_blog])

    respond_to do |format|
      if @mini_blog.save
        flash[:notice] = "Mini-Blog creado exitosamente"
        format.html { redirect_to(@mini_blog) }
        format.xml  { render :xml => @mini_blog, :status => :created, :location => @mini_blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mini_blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mini_blogs/1
  # PUT /mini_blogs/1.xml
  def update
    @mini_blog = MiniBlog.find(params[:id])

    respond_to do |format|
      if @mini_blog.update_attributes(params[:mini_blog])
        flash[:notice] = 'Mini-Blog actualizado exitosamente'
        format.html { redirect_to(@mini_blog) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mini_blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mini_blogs/1
  # DELETE /mini_blogs/1.xml
  def destroy
    @mini_blog = MiniBlog.find(params[:id])
    @mini_blog.destroy

    respond_to do |format|
      format.html { redirect_to(mini_blogs_url) }
      format.xml  { head :ok }
    end
  end
end
