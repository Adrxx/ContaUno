class AddAttachmentAvatarToHomeworkUploads < ActiveRecord::Migration
  def self.up
    change_table :homework_uploads do |t|
      t.attachment :homework
    end
  end

  def self.down
    remove_attachment :homework_uploads, :homework
  end
end
