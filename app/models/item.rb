class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :cost
  belongs_to :day
  belongs_to :status

  belongs_to       :user
  has_one_attached :image
  
  validates :area_id, :category_id, :cost_id, :days_id, :status_id, :item_name, :text, :price, :image, presence: true
  validates :area_id, :category_id, :cost_id, :days_id, :status_id, numericality: { other_than: 1 , message: "を正しく入力してください"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
