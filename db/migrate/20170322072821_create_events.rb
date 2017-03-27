class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :place
      t.datetime :timing
      t.string :title
      t.string :orginazior
      t.string :contact_number
      t.float :latitude
      t.float :longitude
      t.references :user
      t.timestamps
    end
  end
end
