class Project < ApplicationRecord
  belongs_to :user
  has_one_attached :hw_diagram
  has_one_attached :sw_diagram
  has_many :project_tech_tags
  has_many :tech_tags, through: :project_tech_tags,
  has_many :project_phases
  has_many :phases, through: :project_phases,
  has_many :project_roles
  has_many :roles, through: :project_roles,
end
