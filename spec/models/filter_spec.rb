require 'rails_helper'

RSpec.describe Filter do
  describe 'validations' do
    subject { build :filter }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end

  describe 'associations' do
    it { is_expected.to have_many :images }
  end

  describe '#to_s' do
    subject { described_class.new(name: 'Betelgeuse') }

    it 'returns the name of the Band' do
      expect(subject.to_s).to eql 'Betelgeuse'
    end
  end
end
