class RemoveEventby < ActiveRecord::Migration[5.0]
  def change
  	remove_column :events , :eventby_type , :string
  	remove_column :events , :eventby_id , :integer
  end
end
