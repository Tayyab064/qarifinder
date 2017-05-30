class AddFieldToQariVerify < ActiveRecord::Migration[5.0]
  def change
  	add_column :qaris , :email_verified , :boolean , default: false
  	add_column :qaris , :email_token , :string
  end
end
