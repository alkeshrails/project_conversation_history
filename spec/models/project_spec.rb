require 'rails_helper'

RSpec.describe Project do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:status_updates) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
