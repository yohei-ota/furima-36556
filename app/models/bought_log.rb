class BoughtLog < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :bought_user
end
