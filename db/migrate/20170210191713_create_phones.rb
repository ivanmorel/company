class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.references :phone_type, foreign_key: true
      t.references :employee, foreign_key: true
      t.string :phone, limit: 20
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
