require 'rails_helper'

RSpec.describe Image do
  describe 'validations' do
    it { is_expected.to validate_presence_of :file }
    it { is_expected.to validate_presence_of :filter }
    it { is_expected.to validate_presence_of :image_set }
  end

  describe 'associations' do
    it { is_expected.to belong_to :image_set }
    it { is_expected.to belong_to :filter }
  end
end
