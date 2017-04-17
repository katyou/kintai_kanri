class WorkTime < ApplicationRecord
  belongs_to :user

  validates :get_month, presence: true

  #ユーザー情報を持つWorkTimeをすべて取得する
  scope :get_user, -> (current_user){where(user_id: current_user.id)}
  #ログインユーザーとは別のユーザーのWorkTimeをすべて取得する
  scope :get_other_user, -> (user_id){where(user_id: user_id)}


end
