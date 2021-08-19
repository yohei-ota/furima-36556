class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :cost
  belongs_to :day
  belongs_to :status

  belongs_to :users
  has_one_attached :image

  validates :area_id, :category_id, :cost_id, :day_id, :status_id, :item_name, :text, :price, presence: true
  validates :area_id, :category_id, :cost_id, :day_id, :status_id, numericality: { other_than: 1 , message: "を正しく入力してください"}
end
