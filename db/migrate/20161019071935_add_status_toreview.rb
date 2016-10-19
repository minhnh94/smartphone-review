class AddStatusToreview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :status, :integer, default: 0
  end
end
