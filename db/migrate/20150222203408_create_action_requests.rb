class CreateActionRequests < ActiveRecord::Migration
  def change
    create_table :action_requests do |t|
      t.references :target, polymorphic: true, index: true
      t.string :action_type
      t.references :creator, polymorphic: true, index: true
      t.boolean :resolved
      
      t.timestamps
    end
  end
end
