class RemoveImageFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :image, :string
  end
end
