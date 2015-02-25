class CreateActionStatuses < ActiveRecord::Migration
  def change
    create_table :action_statuses do |t|
      t.references :request, index: true
      t.references :user, index: true, polymorphic: true

      t.string :status_type
      t.string :message

      t.timestamps
    end
  end
end
