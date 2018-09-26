class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name 

      t.timestamps null: false
    end

	add_reference :questions, :score, foreign_key: true
	add_reference :questions, :answer, foreign_key: true
  end
end
