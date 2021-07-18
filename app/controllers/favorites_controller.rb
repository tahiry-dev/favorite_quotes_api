class FavoritesController < ApplicationController
    before_action :set_quote, only: :favorite
    before_action :authenticate_user, only: :favorite

    def favorite
        type = params[:type]
        case type
        when 'favorite'
          current_user.favorites << @quote unless current_user.favorites.include? @quote
          render json: { success: true, message: "You favorited #{@quote.author}" }
    
        when 'unfavorite'
          current_user.favorites.delete(@quote) if current_user.favorites.include? @quote
          render json: { success: true, message: "Unfavorited #{@quote.author}" }
    
        else
          render json: { success: false, message: 'Provide a type (favorite/unfavorite)' }, status: :unprocessable_entity
        end
    end
    
end