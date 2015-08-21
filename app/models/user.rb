class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :encrypted_password, presence: true
  validates :email, uniqueness: true

  has_many :image_sets
end
