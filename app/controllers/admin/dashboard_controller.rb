class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  
  def show
    @all_products = Product.all.count
    @all_categories = Category.all.count
  end
end
