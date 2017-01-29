class AddAttachmentMentorThumbnailToMentors < ActiveRecord::Migration
  def self.up
    change_table :mentors do |t|
      t.attachment :mentor_thumbnail
    end
  end

  def self.down
    remove_attachment :mentors, :mentor_thumbnail
  end
end
