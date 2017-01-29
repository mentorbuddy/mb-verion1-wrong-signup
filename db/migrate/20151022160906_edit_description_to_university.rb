class EditDescriptionToUniversity < ActiveRecord::Migration
  def change
  	remove_column :universities, :descrition, :text
  	add_column :universities, :description, :text
  end
end
