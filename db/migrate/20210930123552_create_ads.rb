class CreateAds < ActiveRecord::Migration[6.1]
  def change
    create_table :ads do |t|
      t.string :name
      t.text :body
      t.string :employer_name
      t.string :employer_email
      t.string :category
      t.date :time_period

      t.timestamps
    end
  end
end
