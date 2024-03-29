class ApplicationController < ActionController::API
  attr_reader :current_user

  def set_quote
    @quote = Quote.find(params[:id])
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
