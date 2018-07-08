class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.text :summary
      t.string :picture
      t.integer :profession_id
      t.integer :city_id

      t.timestamps
    end
  end
end
