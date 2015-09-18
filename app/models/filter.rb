class Filter < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :images

  def to_s
    name
  end
end
