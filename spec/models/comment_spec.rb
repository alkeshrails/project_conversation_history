require 'rails_helper'

RSpec.describe Comment do

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:project) }
  end

  describe 'validations' do
    it { should validate_presence_of(:body) }
  end
end
