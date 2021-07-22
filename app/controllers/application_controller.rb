class ApplicationController < ActionController::API
  attr_reader :current_user

  def set_quote
    @quote = Quote.find(params[:id])
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
      image_url: ImageUploader::Attacher.from_model(quote, :image).url,
      created_at: quote.created_at,
      updated_at: quote.updated_at,
      user_id: quote.user_id,
      user_name: quote.user.name,
      favorited_by: quote.favorited_by
    }
  end

  # rubocop:disable Metrics/MethodLength
  def authenticate_user
    secret_word = 'jwt_rock'
    begin
      token = request.headers[:token]
      p secret_word

      decoded_token = JWT.decode token, secret_word, true, { algorithm: 'HS256' }
      user_id = decoded_token[0]['user_id']
      unless user_id
        render json: { msg: 'invalid credentails' }
        return false
      end
      user = User.find_by(id: user_id)
      @current_user = user
      unless user
        render json: { msg: 'invalid credentails' }
        return false
      end
      true
    rescue JWT::DecodeError
      render json: { msg: 'invalid credentails' }
      false
    end
  end
end
# rubocop:enable Metrics/MethodLength
