class WorkTime < ApplicationRecord
  belongs_to :user

  attr_accessor :month

  validates :get_month, presence: true

  #ユーザー情報を持つWorkTimeをすべて取得する
  scope :get_user, -> (current_user){where(user_id: current_user.id)}

end
