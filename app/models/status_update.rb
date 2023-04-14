class StatusUpdate < ApplicationRecord
  belongs_to :statusable, polymorphic: true

  validates :statusable, presence: true
end
