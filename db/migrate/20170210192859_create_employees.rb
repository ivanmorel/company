class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :first_name, limit: 200
      t.string :last_name, limit: 200
      t.references :department, foreign_key: true
      t.references :position, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
