class CreateVoterRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :voter_registrations do |t|
      t.string :first_name
      t.string :last_name
      t.string :ssn
      t.string :date_of_birth
      t.string :phone
      t.string :race
      t.string :sex
      t.string :party
      t.string :voter_id_type
      t.string :voter_id_value
      t.string :registration_address
      
      t.timestamps
    end
  end
end
