class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :title
      t.text :description
      t.references :university, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
