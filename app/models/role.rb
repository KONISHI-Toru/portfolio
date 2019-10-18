class Role < ApplicationRecord
  has_many :project_roles
  has_many :projects, through: :project_roles

  validates :name, presence: true, length: { maximum: 255 }
  validates :display_order, presence: true, numericality: { only_integer: true }
end
