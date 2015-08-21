class Image < ActiveRecord::Base
  validates :file, :image_set, presence: true

  belongs_to :image_set
  belongs_to :band
end
