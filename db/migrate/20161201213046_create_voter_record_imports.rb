class CreateVoterRecordImports < ActiveRecord::Migration[5.0]
  def change
    create_table :voter_record_imports do |t|
      t.string :filename
      t.integer :record_count
      t.boolean :valid_file
      t.string :state_abbr

      t.timestamps
    end
  end
end
