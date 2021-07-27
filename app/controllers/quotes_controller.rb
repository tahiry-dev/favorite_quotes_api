class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show update destroy]
  before_action :authenticate_user, only: %i[update destroy]

  def index
    @quotes = render json: Quote.all.order('created_at DESC')
    # render json: serialize_quotes(@quotes)
  end

  def show
    render json: Quote.find(params[:id])
    # render json: serialize_quote(@quote)
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      # render json: serialize_quote(@quote), status: :created, location: @quote
      render json: @quote
    else
      render json: @quote.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @quote.update(quote_params)
      # render json: serialize_quote(@quote)
      render json: @quote
    else
      render json: @quote.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    # render json: serialize_quote(@quote)
    render json: @quote
  end

  private

  def quote_params
    params.permit(:user_id, :author, :description, :image)
  end
end
