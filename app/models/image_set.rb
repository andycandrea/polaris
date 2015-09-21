class ImageSet < ActiveRecord::Base
  validates :user, presence: true

  belongs_to :user

  has_many :images, inverse_of: :image_set

  accepts_nested_attributes_for :images
end
