class Item < ApplicationRecord
  
  belongs_to :user
  has_one    :buyer
  has_one_attached :image
  has_many :comments
  has_many :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :region
  belongs_to :shipment

  validates :title,    presence: true
  validates :overview, presence: true
  validates :image,    presence: true
  validates :category_id,  numericality: { other_than: 1 , message: "を選択してください"}
  validates :status_id,    numericality: { other_than: 1 , message: "を選択してください"}
  validates :burden_id,    numericality: { other_than: 1 , message: "を選択してください"}
  validates :region_id ,   numericality: { other_than: 1 , message: "を選択してください"}
  validates :shipment_id,  numericality: { other_than: 1 , message: "を選択してください"}
  validates :price,        numericality: { greater_than: 299, less_than: 10_000_000, only_integer: true }
end
