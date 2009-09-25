require 'spec/spec_helper'

describe MiniBlogsController do

  before(:each) do
     @usuario = Factory.create(:user_administrator)
     controller.stub!(:current_user).and_return @usuario
  end
   
  def mock_mini_blog(stubs={})
    @mock_mini_blog ||= mock_model(MiniBlog, stubs)
  end

  describe "GET index" do
    it "assigns all mini_blogs as @mini_blogs" do
      MiniBlog.stub!(:find).with(:all).and_return([mock_mini_blog])
      get :index
      assigns[:mini_blogs].should == [mock_mini_blog]
    end
  end

  describe "GET show" do
    before(:each) do
      @entrada = Factory.create(:entrada)
    end
    
    it "assigns the requested mini_blog as @mini_blog" do
      MiniBlog.stub!(:find).with("37").and_return(@entrada.mini_blog)
      get :show, :id => "37"
      assigns[:mini_blog].should == @entrada.mini_blog
    end
    
    it "assigns the related mini_blog as @entradas" do
      MiniBlog.stub!(:find).with("37").and_return(@entrada.mini_blog)
      get :show, :id => "37"
      assigns[:entradas].should == @entrada.mini_blog.entradas
    end
  end

  describe "GET new" do
    it "assigns a new mini_blog as @mini_blog" do
      MiniBlog.stub!(:new).and_return(mock_mini_blog)
      get :new
      assigns[:mini_blog].should equal(mock_mini_blog)
    end
  end

  describe "GET edit" do
    it "assigns the requested mini_blog as @mini_blog" do
      MiniBlog.stub!(:find).with("37").and_return(mock_mini_blog)
      get :edit, :id => "37"
      assigns[:mini_blog].should equal(mock_mini_blog)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created mini_blog as @mini_blog" do
        MiniBlog.stub!(:new).with({'these' => 'params'}).and_return(mock_mini_blog(:save => true))
        post :create, :mini_blog => {:these => 'params'}
        assigns[:mini_blog].should equal(mock_mini_blog)
      end

      it "redirects to the created mini_blog" do
        MiniBlog.stub!(:new).and_return(mock_mini_blog(:save => true))
        post :create, :mini_blog => {}
        response.should redirect_to(mini_blog_url(mock_mini_blog))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mini_blog as @mini_blog" do
        MiniBlog.stub!(:new).with({'these' => 'params'}).and_return(mock_mini_blog(:save => false))
        post :create, :mini_blog => {:these => 'params'}
        assigns[:mini_blog].should equal(mock_mini_blog)
      end

      it "re-renders the 'new' template" do
        MiniBlog.stub!(:new).and_return(mock_mini_blog(:save => false))
        post :create, :mini_blog => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested mini_blog" do
        MiniBlog.should_receive(:find).with("37").and_return(mock_mini_blog)
        mock_mini_blog.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :mini_blog => {:these => 'params'}
      end

      it "assigns the requested mini_blog as @mini_blog" do
        MiniBlog.stub!(:find).and_return(mock_mini_blog(:update_attributes => true))
        put :update, :id => "1"
        assigns[:mini_blog].should equal(mock_mini_blog)
      end

      it "redirects to the mini_blog" do
        MiniBlog.stub!(:find).and_return(mock_mini_blog(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(mini_blog_url(mock_mini_blog))
      end
    end

    describe "with invalid params" do
      it "updates the requested mini_blog" do
        MiniBlog.should_receive(:find).with("37").and_return(mock_mini_blog)
        mock_mini_blog.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :mini_blog => {:these => 'params'}
      end

      it "assigns the mini_blog as @mini_blog" do
        MiniBlog.stub!(:find).and_return(mock_mini_blog(:update_attributes => false))
        put :update, :id => "1"
        assigns[:mini_blog].should equal(mock_mini_blog)
      end

      it "re-renders the 'edit' template" do
        MiniBlog.stub!(:find).and_return(mock_mini_blog(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested mini_blog" do
      MiniBlog.should_receive(:find).with("37").and_return(mock_mini_blog)
      mock_mini_blog.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the mini_blogs list" do
      MiniBlog.stub!(:find).and_return(mock_mini_blog(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(mini_blogs_url)
    end
  end

end
