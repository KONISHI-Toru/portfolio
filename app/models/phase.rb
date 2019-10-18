class Phase < ApplicationRecord
  has_many :project_phases
  has_many :projects, through: :project_phases

  validates :name, presence: true, length: { maximum: 255 }
  validates :display_order, presence: true, numericality: { only_integer: true }
end
