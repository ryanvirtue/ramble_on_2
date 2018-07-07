class AddFeatureColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :feature, :boolean
  end
end
