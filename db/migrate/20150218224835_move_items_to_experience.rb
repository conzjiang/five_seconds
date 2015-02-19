class MoveItemsToExperience < ActiveRecord::Migration
  def up
    add_column :experiences, :summary, :text

    Experience.includes(:items).each do |exp|
      summary_items = exp.items.map(&:description)
      exp.update!(summary: "- " + summary_items.join("\r\n- "))
    end

    drop_table :items
  end

  def down
    create_table :items do |t|
      t.integer :experience_id
      t.text :description
      t.timestamps
    end

    add_index :items, :experience_id

    Experience.all.each do |exp|
      exp.items.each do |item|
        Item.create!(experience_id: exp.id, description: item)
      end
    end

    remove_column :experiences, :summary
  end
end
