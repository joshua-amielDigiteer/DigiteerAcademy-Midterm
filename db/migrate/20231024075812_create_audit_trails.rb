class CreateAuditTrails < ActiveRecord::Migration[7.0]
  def change
    create_table :audit_trails do |t|
      t.string :module_action 
      t.string :module_name
      t.text :module_data
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
