require 'rails_helper'

RSpec.describe StatusUpdate do

  describe 'associations' do
    it { is_expected.to belong_to(:statusable) }
  end

  describe 'validations' do
    it { should validate_presence_of(:statusable) }
  end
end
