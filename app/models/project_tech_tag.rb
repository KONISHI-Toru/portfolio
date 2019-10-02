class ProjectTechTag < ApplicationRecord
  belongs_to :tech_category
  belongs_to :tech_tag
end
