class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file, null: false
      t.string :image_set_id, null: false
      t.string :band_id

      t.timestamps
    end

    add_index :images, :image_set_id
  end
end
