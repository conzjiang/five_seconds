class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :title
      t.integer :company_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
