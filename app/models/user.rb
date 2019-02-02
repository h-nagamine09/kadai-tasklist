class User < ApplicationRecord
  # 文字を全て小文字に変換
  before_save {self.email.downcase!}
  #nameのバリデーション。カラを許さず長さ５０文字以内
  validates :name, presence: true, length: {maximum: 50}
  #emailのバリデーション。カラを許さず２５５文字以内。format〜は正規表現
  validates :email, presence: true, length: {maximum: 255},
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i} ,
            # 重複を許さないバリデーション。大文字と小文字を区別しない
            uniqueness: {case_sensitive: false}
  # パスワードを暗号化して保存
  # ログイン認証用のメソッドauthenticateを提供する
  has_secure_password
  
  # UserからTaskをみた時複数存在する
  has_many :tasks
end
