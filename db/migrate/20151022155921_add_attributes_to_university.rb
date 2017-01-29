class AddAttributesToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :title, :string
    add_column :universities, :descrition, :text
    add_column :universities, :itunes, :string
    add_column :universities, :stitcher, :string
    add_column :universities, :podbay, :string
  end
end
