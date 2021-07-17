class Api::UsersController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    unless user
      render json: { msg: 'invalid credentails ' }, status: 406
      return
    end
    if user.password == params[:password]
      exp = Time.now.to_i + 4 * 3600
      payload = {
        user_id: user.id,
        name: user.name,
        nickname: user.nickname,
        exp: exp
      }
      token = the_auth(payload)
      render json: { token: token }
    else
      render json: { msg: 'invalid credentails ' }, status: 406
    end
  end

  def signup
    p params
    user = User.new(user_params)
    if user.save
      exp = Time.now.to_i + 4 * 3600
      payload = {
        user_id: user.id,
        name: user.name,
        nickname: user.nickname,
        exp: exp
      }
      token = the_auth(payload)

      render json: { token: token }
    else
      render json: { msg: 'try again later' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :nickname, :image)
  end

  def the_auth(payload)
    secret_word = 'jwt_rock'

    begin
      JWT.encode payload, secret_word, 'HS256'
    rescue JWT::InvalidAudError
      false
    end
  end
end
