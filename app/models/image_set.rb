class ImageSet < ActiveRecord::Base
  validates :user, presence: true

  belongs_to :user

  has_many :images, inverse_of: :image_set

  accepts_nested_attributes_for :images

  def red_image
    images.joins(:filter).where(Filter.arel_table[:name].lower.eq('red')).first
  end

  def green_image
    images.joins(:filter).where(Filter.arel_table[:name].lower.eq('green')).first
  end

  def blue_image
    images.joins(:filter).where(Filter.arel_table[:name].lower.eq('blue')).first
  end
end
