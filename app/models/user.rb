class User < ApplicationRecord
  has_many :quotes, dependent: :destroy
  has_many :favorite, dependent: :destroy
  has_many :favorites, through: :favorite, source: :quote, dependent: :destroy

  validates :email, presence: true, length: { minimum: 6, maximum: 80 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6, maximum: 80 }
  validates :name, presence: true, length: { minimum: 6, maximum: 80 }
  validates :nickname, presence: true, length: { minimum: 2, maximum: 20 }
  validates_uniqueness_of :email, on: :create
end
