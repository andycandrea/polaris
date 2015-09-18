class ChangeBandsToFilters < ActiveRecord::Migration
  def change
    rename_table :bands, :filters
    rename_column :images, :band_id, :filter_id
    change_column_null :filters, :frequency, true
  end
end
