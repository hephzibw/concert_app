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

end