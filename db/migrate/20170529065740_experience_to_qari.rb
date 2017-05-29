class ExperienceToQari < ActiveRecord::Migration[5.0]
  def change
  	add_column :qaris , :experience , :string
  end
end
