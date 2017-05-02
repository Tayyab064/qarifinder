class EventDescription < ActiveRecord::Migration[5.0]
  def change
  	add_column :events , :description , :string , default: ''
  end
end
