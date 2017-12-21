class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :address_type, foreign_key: true
      t.references :employee, foreign_key: true
      t.string :address1, limit: 200
      t.string :address2, limit: 200
      t.string :city, limit: 100
      t.string :state, limit: 50
      t.string :zip_code, limit: 10
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
