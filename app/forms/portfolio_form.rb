# coding: utf-8
class PortfolioForm
  include ActiveModel::Model

  attr_accessor :user_id, :tech_tag_ids

  validates :user_id, presence: true
  
  def search
    condition = Project

    # user_id は必須。
    condition = condition.where(user_id: user_id)
    if tech_tag_ids.present?
      condition = condition.where(tech_tags: {id: tech_tag_ids})
    end
  end
end