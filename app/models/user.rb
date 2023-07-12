class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :items
  has_many :buyers
  has_many :comments
  has_many :likes
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname,          presence: true
  validates :password, format:                          { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }
  validates :sur_name,          presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/, message: 'が無効です' }
  validates :name,              presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/, message: 'が無効です' }
  validates :sur_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'が無効です'}
  validates :name_katakana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'が無効です'}
  validates :birth_day,         presence: true
end
