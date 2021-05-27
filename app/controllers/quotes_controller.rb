class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show update destroy favorite]
  before_action :authenticate_api_user!, only: %i[update favorite destroy]

  # GET /quotes
  def index
    @quotes = Quote.all.order('created_at DESC')

    render json: serialize_quotes(@quotes)
  end

  # GET /quotes/1
  def show
    render json: serialize_quote(@quote)
  end

  # POST /quotes
  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      render json: serialize_quote(@quote), status: :created, location: @quote
    else
      render json: @quote.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quotes/1
  def update
    if @quote.update(quote_params)
      render json: serialize_quote(@quote)
    else
      render json: @quote.errors.full_messages, status: :unprocessable_entity
    end
  end

  # DELETE /quotes/1
  def destroy
    @quote.destroy
    render json: serialize_quote(@quote)
  end

  # POST /quotes/:id/favorite
  def favorite
    type = params[:type]
    case type
    when 'favorite'
      current_api_user.favorites << @quote unless current_api_user.favorites.include? @quote
      render json: { success: true, message: "You favorited #{@quote.author}" }

    when 'unfavorite'
      current_api_user.favorites.delete(@quote) if current_api_user.favorites.include? @quote
      render json: { success: true, message: "Unfavorited #{@quote.author}" }

    else
      render json: { success: false, message: 'Provide a type (favorite/unfavorite)' }, status: :unprocessable_entity
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.permit(:user_id, :author, :description, :price, :ratings, :usedFor, :image)
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
      user_author: quote.user.author,
      favorited_by: quote.favorited_by
    }
  end
end
