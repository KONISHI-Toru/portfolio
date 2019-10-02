class Role < ApplicationRecord
  has_many :project_roles
  has_many :projects, through: :project_roles
end
