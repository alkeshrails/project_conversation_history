require 'rails_helper'

RSpec.describe User do

  describe 'associations' do
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:projects) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
