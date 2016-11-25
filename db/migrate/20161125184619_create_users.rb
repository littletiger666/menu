class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :provide
      t.string :sex
      t.string :avatar
      t.string :country
      t.string :provice
      t.string :city

      t.timestamps
    end
  end
end
