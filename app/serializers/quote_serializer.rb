class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :author, :description,
             :ratings,
             :user_id, :favorited_by, :image_url

  belongs_to :user

  def image_url
    quote = Quote.find(object.id)
    ImageUploader::Attacher.from_model(quote, :image).url
  end
end
