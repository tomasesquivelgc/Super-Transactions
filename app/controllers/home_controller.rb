class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:splash]
  helper_method :calculate_total_amount
  def index
    @categories = Category.all.includes(:categorizations)
  end

  def splash; end

  def calculate_total_amount(category)
    category.categorizations.map { |categorization| categorization.categorized_transaction.amount.to_f }.sum
  end
end
