class UpdateForeignKeyForUser < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :ads, :users
    add_foreign_key :ads, :users, on_delete: :cascade
  end
end
