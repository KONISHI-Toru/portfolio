class Phase < ApplicationRecord
  has_many :project_phases
  has_many :projects, through: :project_phases
end
