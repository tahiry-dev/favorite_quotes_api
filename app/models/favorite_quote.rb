class FavoriteQuote < ApplicationRecord
    validates_presence_of :user_id
    validates_presence_of :quote_id
  
    belongs_to :user
    belongs_to :quote
end