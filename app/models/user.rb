# -*- coding: utf-8 -*-
class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_secure_password validations: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 6 }, allow_blank: true

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # 公開対象のユーザのリストを返す。
  def User.published
    User.where(published: true)
  end
end
