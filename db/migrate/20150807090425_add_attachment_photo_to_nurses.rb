class AddAttachmentPhotoToNurses < ActiveRecord::Migration
  def self.up
    change_table :nurses do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :nurses, :photo
  end
end
