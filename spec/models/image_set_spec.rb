require 'rails_helper'

RSpec.describe ImageSet do
  describe 'validations' do
    it { is_expected.to validate_presence_of :user }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :images }
    it { is_expected.to have_many :color_images }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for :images }
  end
end
