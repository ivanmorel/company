class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.string :name, limit: 50
      t.string :description, limit: 100
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
