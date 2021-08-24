class BoughtLogBoughtUser
  include ActiveModel::Model
  attr_accessor :item_id, :bought_log_id, :user_id, :postal_code, :area_id, :munucipalities, :address, :building, :phone_number

  with_options presence: true do
    validates :munucipalities, :address, :phone_number, :item_id, :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
  end
  validates :area_id, numericality: { other_than: 1 , message: "を正しく入力してください" }
  
  def save
    bought_log = BoughtLog.create(item_id: item_id, user_id: user_id)
    BoughtUser.create(postal_code: postal_code, area_id: area_id, munucipalities: munucipalities, address: address, building: building, phone_number: phone_number, bought_log_id: bought_log.id)
  end
end