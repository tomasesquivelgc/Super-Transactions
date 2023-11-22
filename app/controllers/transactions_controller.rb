class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show]
  before_action :set_categories, only: %i[new create]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    @categorizations = Categorization.all
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @categorizations = Categorization.all
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params.except(:category_ids))

    respond_to do |format|
      if @transaction.save
        create_or_update_categorizations(@transaction, transaction_params[:category_ids])
        format.html { redirect_to transaction_url(@transaction), notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_categories
    @categories = Category.all
  end

  def create_or_update_categorizations(transaction, category_ids)
    # Clear existing categorizations and create new ones
    transaction.categorizations.destroy_all
    category_ids.each do |category_id|
      transaction.categorizations.create(category_id: category_id)
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :amount, { category_ids: [] }, :user_id)
  end
  
  
end
