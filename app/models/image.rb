class Image < ActiveRecord::Base
  validates :file, :image_set, :filter, presence: true

  belongs_to :image_set
  belongs_to :filter
end
