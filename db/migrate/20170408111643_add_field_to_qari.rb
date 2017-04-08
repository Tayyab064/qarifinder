class AddFieldToQari < ActiveRecord::Migration[5.0]
  def change
  	add_column :qaris , :hourly_rate , :float , default: 0.0
  	add_column :qaris , :awards , :string , default: ''
  	remove_column :events , :user_id , :integer
  	add_column :events , :eventby_type , :string
  	add_column :events , :eventby_id , :integer
  end
end
