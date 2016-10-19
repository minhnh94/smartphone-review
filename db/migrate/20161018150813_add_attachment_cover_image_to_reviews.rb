class AddAttachmentCoverImageToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :cover_image
    end
  end

  def self.down
    remove_attachment :reviews, :cover_image
  end
end
