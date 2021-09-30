class AddAdRefToJobs < ActiveRecord::Migration[6.1]
  def change
    add_reference :jobs, :ad, null: false, foreign_key: true
  end
end
