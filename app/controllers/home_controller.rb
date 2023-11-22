class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:splash]
  def index
    @categories = Category.all.includes(:categorizations)
  end

  def splash; end
end
