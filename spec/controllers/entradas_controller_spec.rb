require 'spec/spec_helper'

describe EntradasController do

  def mock_entrada(stubs={})
    @mock_entrada ||= mock_model(Entrada, stubs)
  end

  before(:each) do
    @entrada = Factory.create(:entrada)
    @mini_blog = @entrada.mini_blog
    MiniBlog.stub!(:find).and_return(@mini_blog)
  end

  describe "GET index" do
    it "assigns all entradas as @entradas" do
      get :index
      @mini_blog.entradas.stub!(:find)
      assigns[:entradas] == []
    end
  end

  describe "GET show" do
    it "assigns the requested entrada as @entrada" do
      @mini_blog.entradas.stub!(:find)
      get :show, :id => "37"
      assigns[:entrada] == []
    end
  end

  describe "GET new" do
    it "assigns a new entrada as @entrada" do
      Entrada.stub!(:new).and_return(mock_entrada)
      get :new, :mini_blog_id => 12
      assigns[:entrada].should equal(mock_entrada)
    end
  end

  describe "GET edit" do
    it "assigns the requested entrada as @entrada" do
      @mini_blog.entradas.should_receive(:find).and_return(@entrada)
      get :edit, :id => "37", :mini_blog_id => @mini_blog.id
      assigns[:entrada].should == @entrada
    end
  end

  describe "POST create" do
    
    before(:each) do
      @user=@entrada.user
      controller.stub!(:current_user).and_return @user
      @params = @entrada.attributes
    end
    
    describe "with valid params" do
      it "assigns a newly created entrada as @entrada" do
        @mini_blog.entradas.stub!(:new).with(@params).and_return(@entrada)
        post :create, :entrada => @params
        assigns[:entrada].should eql(@entrada)
      end

      it "redirects to the created entrada" do
        @mini_blog.entradas.stub!(:new).with(@params).and_return(@entrada)
        post :create, :entrada => @params
        response.should redirect_to(mini_blog_entrada_path(@mini_blog, @entrada))
      end
      
      it "sets the current_user to entrada" do
        @mini_blog.entradas.stub!(:new).with(@params).and_return(@entrada)
        post :create, :entrada => @params
        assigns[:entrada].user.should == @user
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved entrada as @entrada" do
        @mini_blog.entradas.stub!(:new).and_return(mock_entrada(:save => false))
        post :create, :entrada => {:titulo => ''}
        assigns[:entrada].should equal(mock_entrada)
      end

      it "re-renders the 'new' template" do
        @mini_blog.entradas.stub!(:new).and_return(mock_entrada(:save => false))
        post :create, :entrada => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested entrada" do
        @mini_blog.entradas.stub!(:find).and_return(@entrada)
        @entrada.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => @entrada.id, :entrada => {:these => 'params'}
      end

      it "assigns the requested entrada as @entrada" do
        @mini_blog.entradas.stub!(:find).and_return(@entrada)
        put :update, :id => @entrada.id
        assigns[:entrada].should equal(@entrada)
      end

      it "redirects to the entrada" do
        @mini_blog.entradas.stub!(:find).and_return(@entrada)
        put :update, :id => @entrada.id
        response.should redirect_to(mini_blog_entrada_path(@mini_blog, @entrada))
      end
    end

    describe "with invalid params" do
      it "updates the requested entrada" do
        @mini_blog.entradas.stub!(:find).and_return(@entrada)
        @entrada.should_receive(:update_attributes).with({"titulo" => ""})
        put :update, :id => @entrada.id, :entrada => {:titulo => ""}
      end

      it "assigns the entrada as @entrada" do
        Entrada.stub!(:find).and_return(mock_entrada(:update_attributes => false))
        put :update, :id => "1"
        assigns[:entrada].should equal(mock_entrada)
      end

      it "re-renders the 'edit' template" do
        Entrada.stub!(:find).and_return(mock_entrada(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested entrada" do
      @mini_blog.entradas.stub!(:find).and_return(@entrada)
      @entrada.should_receive(:destroy)
      delete :destroy, :id => @entrada.id
    end

    it "redirects to the entradas list" do
      @mini_blog.entradas.stub!(:find).and_return(@entrada)
      delete :destroy, :id => "1"
      response.should redirect_to(mini_blog_url(@mini_blog))
    end
  end

end
