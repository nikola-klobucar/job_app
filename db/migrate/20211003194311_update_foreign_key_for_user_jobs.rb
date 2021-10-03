class UpdateForeignKeyForUserJobs < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :jobs, :users
    add_foreign_key :jobs, :users, on_delete: :cascade
  end
end
