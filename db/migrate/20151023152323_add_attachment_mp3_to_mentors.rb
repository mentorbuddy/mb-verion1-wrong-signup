class AddAttachmentMp3ToMentors < ActiveRecord::Migration
  def self.up
    change_table :mentors do |t|
      t.attachment :mp3
    end
  end

  def self.down
    remove_attachment :mentors, :mp3
  end
end
