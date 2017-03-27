class CreateQaris < ActiveRecord::Migration[5.0]
  def change
    create_table :qaris do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :mobile_number
      t.string :token
      t.string :password_reset_token
      t.string :address
      t.datetime :dob
      t.integer :gender
      t.string :qualification
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
