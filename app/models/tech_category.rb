class TechCategory < ApplicationRecord
  has_many :tech_tags, -> { order(:display_order) }
end
