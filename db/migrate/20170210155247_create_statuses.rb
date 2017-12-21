class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.string :name, limit: 50
      t.string :description, limit: 200

      t.timestamps
    end
  end
end
