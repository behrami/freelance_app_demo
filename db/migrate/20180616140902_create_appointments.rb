class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.text :summary
      t.datetime :time
      t.integer :user_id
      t.integer :user_booked_id

      t.timestamps
    end
  end
end
