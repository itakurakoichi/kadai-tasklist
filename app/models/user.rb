class User < ApplicationRecord
	# User インスタンス（レコード）を保存するその前に、self.email.downcase! を実行
	before_save { self.email.downcase! }
	
	# バリデーション
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
	
	# パスワード付きのモデルの作成
	# - password_digest カラムを用意し、モデルファイルに has_secure_password を記述すれば
	#   ログイン認証のための準備を良しなにする
	# - 暗号化のために bcrypt Gem が必要
	has_secure_password
	
	# 一対多を表現しておきます。 User から Task をみたとき、複数存在する
	has_many :todos
end
