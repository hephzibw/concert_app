require "spec_helper"

describe MembersController do
  render_views
  describe "index" do
    before :each do
      m1 = Factory :member
      m2 = Factory :member
      @members=[m1, m2]
    end

    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have an element for each user" do
      get :index
      @members.each do |member|
        response.should have_selector("td", :content=>member.name)
        response.should have_selector("td", :content=>member.email)
        response.should have_selector("td", :content=>member.contact_no)
        response.should have_selector("td", :content=>member.city)
      end
    end
  end

  describe "new" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have a name field" do
      get :new
      response.should have_selector("input[name='member[name]'][type='text']")
      end

    it "should have an email field" do
      get :new
      response.should have_selector("input[name='member[email]'][type='text']")
      end

    it "should have a contact_no field" do
      get :new
      response.should have_selector("input[name='member[contact_no]'][type='text']")
      end

    it "should have a city field" do
      get :new
      response.should have_selector("input[name='member[city]'][type='text']")
    end
  end

  describe "create" do
    before :each do
      @attr = {:name => "Hepz", :email => "hwath@gmail.com", :contact_no => "213-440-678", :city => "Delhi"}
    end

    it "should successfully create a new member" do
      lambda{post :create, :member => @attr}.should change(Member, :count).by(1)
    end

    it "should flash success message 'member successfully added'" do
      post :create, :member => @attr
      flash[:success].should =~ /member successfully added/i
    end
  end

end