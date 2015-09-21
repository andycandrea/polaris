class AddNameAndImagedAtToImageSets < ActiveRecord::Migration
  def change
    add_column :image_sets, :imaged_on, :date
    add_column :image_sets, :name, :string
  end
end
