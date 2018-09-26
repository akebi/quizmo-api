class CreateScores < ActiveRecord::Migration
	def change
		create_table :scores do |t|
     		t.integer :full_value
			t.integer :markdown_value

      		t.timestamps null: false
    	end
  	end
end
