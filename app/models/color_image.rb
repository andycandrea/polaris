class ColorImage < ActiveRecord::Base
  mount_uploader :file, ImageUploader

  validates :file, presence: true
  validates :image_set, presence: true

  delegate :name, to: :image_set
  delegate :imaged_on, to: :image_set

  belongs_to :image_set
end
