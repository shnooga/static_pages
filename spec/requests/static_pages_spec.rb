require 'spec_helper'

describe "Static Pages" do
  describe "Home Page" do
    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App")
    end

    it "should have a custom page title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => '| Home')
    end
  end

end

