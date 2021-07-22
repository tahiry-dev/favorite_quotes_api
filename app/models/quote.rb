class Quote < ApplicationRecord
  include ImageUploader::Attachment(:image)

  include Rails.application.routes.url_helpers

  belongs_to :user

  has_many :favorites, dependent: :destroy

  has_many :favorited_by, through: :favorites, source: :user, dependent: :destroy

  validates :author, presence: true, length: { minimum: 2, maximum: 40 }

  validates :description, presence: true, length: { minimum: 6, maximum: 50_000 }

  def set_host
    Rails.env.production? ? 'https://your-favorite-quotes-api.herokuapp.com' : 'http://localhost:5000'
  end

  def image_url
    if image.nil?

      "<img src='http://loremflickr.com/600/800/man' alt='Man'/>"

    else

      rails_representation_url(image.variant(resize: '600x800'), host: set_host)

    end
  end
end
