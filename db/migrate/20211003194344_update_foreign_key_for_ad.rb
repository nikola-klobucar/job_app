class UpdateForeignKeyForAd < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :jobs, :ads
    add_foreign_key :jobs, :ads, on_delete: :cascade
  end
end
