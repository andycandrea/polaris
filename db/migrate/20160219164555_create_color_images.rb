class CreateColorImages < ActiveRecord::Migration
  def change
    create_table :color_images do |t|
      t.string :file, null: false
      t.integer :image_set_id, null: false

      t.timestamps
    end
  end
end
