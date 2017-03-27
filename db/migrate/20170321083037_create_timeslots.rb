class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.string :timeslot
      t.string :dayslot
      t.references :qari
      t.timestamps
    end
  end
end
