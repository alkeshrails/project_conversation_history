class Project < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :status_updates, as: :statusable

  validates :name, presence: true

  enum :status, [ :pending, :draft, :canceled, :completed ]

  before_update :add_status_change

  def status_changes
    StatusUpdate.where(statusable_id: self.id, statusable_type: self.class.name)
  end

  def add_status_change
    if status_changed?
      description = "Changed status to #{self.status} from #{status_was} on #{Time.current.strftime('%B %d, %Y at %H:%M %p')}"
      StatusUpdate.create(statusable_id: self.id, statusable_type: self.class.name, description: description)
    end
  end
end
