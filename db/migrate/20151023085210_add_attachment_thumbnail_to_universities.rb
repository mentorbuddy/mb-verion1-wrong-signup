class AddAttachmentThumbnailToUniversities < ActiveRecord::Migration
  def self.up
    change_table :universities do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :universities, :thumbnail
  end
end
