class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :experience_id
      t.text :description
      t.timestamps
    end

    add_index :items, :experience_id
  end
end
