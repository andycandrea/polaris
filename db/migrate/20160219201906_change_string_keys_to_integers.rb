class Image < ActiveRecord::Base
end

class ChangeStringKeysToIntegers < ActiveRecord::Migration
  def up
    Image.connection.schema_cache.clear!
    Image.reset_column_information

    rename_column :images, :image_set_id, :old_image_set_id
    rename_column :images, :filter_id, :old_filter_id

    add_column :images, :image_set_id, :integer
    add_column :images, :filter_id, :integer

    Image.find_each do |image|
      image.update_attributes!(
        image_set_id: image.old_image_set_id.to_i,
        filter_id: image.old_filter_id.to_i
      )
    end

    remove_column :images, :old_image_set_id
    remove_column :images, :old_filter_id
  end

  def down
    Image.connection.schema_cache.clear!
    Image.reset_column_information

    rename_column :images, :image_set_id, :old_image_set_id
    rename_column :images, :filter_id, :old_filter_id

    add_column :images, :image_set_id, :string
    add_column :images, :filter_id, :string

    Image.find_each do |image|
      image.update_attributes!(
        image_set_id: image.old_image_set_id.to_s,
        filter_id: image.old_filter_id.to_s
      )
    end

    remove_column :images, :old_image_set_id
    remove_column :images, :old_filter_id
  end
end
