class PagesController < ApplicationController
  def home #defines the homepage
  @basic_plan = Plan.find(1)
  @pro_plan = Plan.find(2)
  end
  
  def about #defines the about page
  end
end