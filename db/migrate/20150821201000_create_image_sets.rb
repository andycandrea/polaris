class CreateImageSets < ActiveRecord::Migration
  def change
    create_table :image_sets do |t|
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :image_sets, :user_id
  end
end
