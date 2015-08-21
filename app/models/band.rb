class Band < ActiveRecord::Base
  validates :name, :frequency, presence: true
  validates :name, uniqueness: true

  has_many :images

  def to_s
    name
  end
end
