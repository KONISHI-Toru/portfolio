class TechTag < ApplicationRecord
  belongs_to :tech_category
  has_many :project_tech_tags
  has_many :projects, through: :project_tech_tags
end
