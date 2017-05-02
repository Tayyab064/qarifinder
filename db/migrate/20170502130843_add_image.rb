class AddImage < ActiveRecord::Migration[5.0]
  def change
  	add_column :qaris , :image , :string
  	add_column :users , :image , :string
  end
end
