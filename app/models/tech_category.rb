class TechCategory < ApplicationRecord
  has_many :tech_tags, -> { order(:display_order) }, inverse_of: :tech_category

  validates :name, presence: true, length: { maximum: 255 }
  validates :display_order, presence: true, numericality: { only_integer: true }
end
