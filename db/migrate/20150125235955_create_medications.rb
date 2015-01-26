class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
    	t.string :name
    	t.string :dose
    	t.integer :patient_id
      t.timestamps null: false
    end
  end
end
