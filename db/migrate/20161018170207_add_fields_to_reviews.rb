class AddFieldsToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :summary, :text
    add_column :reviews, :the_good, :text
    add_column :reviews, :the_bad, :text
    add_column :reviews, :score_design, :integer
    add_column :reviews, :score_screen, :integer
    add_column :reviews, :score_performance, :integer
    add_column :reviews, :score_battery, :integer
    add_column :reviews, :score_camera, :integer
  end
end
