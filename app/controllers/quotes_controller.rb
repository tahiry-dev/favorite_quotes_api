class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show update destroy]
  before_action :authenticate_user, only: %i[show update destroy]

  def index
    @quotes = Quote.all.order('created_at DESC')

    render json: serialize_quotes(@quotes)
  end

  def show
    render json: serialize_quote(@quote)
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      render json: serialize_quote(@quote), status: :created, location: @quote
    else
      render json: @quote.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @quote.update(quote_params)
      render json: serialize_quote(@quote)
    else
      render json: @quote.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    render json: serialize_quote(@quote)
  end

  private

  def quote_params
    params.permit(:user_id, :author, :description, :image)
  end

  def serialize_quotes(quotes)
    quotes.map { |quote| serialize_quote(quote) }
  end

  def serialize_quote(quote)
    {
      id: quote.id,
      author: quote.author,
      description: quote.description,
      ratings: quote.ratings,
      image_url: quote.image_url,
      created_at: quote.created_at,
      updated_at: quote.updated_at,
      user_id: quote.user_id,
      user_name: quote.user.name,
      favorited_by: quote.favorited_by
    }
  end
end
