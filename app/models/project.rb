class Project < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :name, presence: true

  enum :status, [ :pending, :draft, :canceled, :completed ]
end
