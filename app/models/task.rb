class Task < ApplicationRecord
	# User と Task の一対多
	# task.user で、この task インスタンスを持っている User を取得できる
	belongs_to :user
	
	# ユーザの紐付け無しには Task を保存できないようにする
	validates :user_id, presence: true

	validates :content, presence: true, length: { maximum: 100 }
	validates :status, presence: true, length: { maximum: 10 }
end
