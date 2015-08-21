require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    subject { build :user }

    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :encrypted_password }
    it { is_expected.to validate_uniqueness_of :email }
  end

  describe 'associations' do
    it { is_expected.to have_many :image_sets }
  end
end
