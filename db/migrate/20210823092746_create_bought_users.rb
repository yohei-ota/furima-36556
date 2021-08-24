class CreateBoughtUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :bought_users do |t|
      t.string     :postal_code,    null: false
      t.integer    :area_id,        null: false
      t.string     :munucipalities, null: false
      t.string     :address,        null: false
      t.string     :building
      t.string     :phone_number,   null: false
      t.references :bought_log,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
