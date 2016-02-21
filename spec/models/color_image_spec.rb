require 'rails_helper'

describe ColorImage do
  describe 'validations' do
    it { is_expected.to validate_presence_of :file }
    it { is_expected.to validate_presence_of :image_set }
  end

  describe 'delegations' do
    it { is_expected.to delegate_method(:name).to :image_set }
    it { is_expected.to delegate_method(:imaged_on).to :image_set }
  end

  describe 'associations' do
    it { is_expected.to belong_to :image_set }
  end
end
