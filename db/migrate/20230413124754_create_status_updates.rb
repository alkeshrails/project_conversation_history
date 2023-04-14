class CreateStatusUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :status_updates do |t|
      t.references :statusable, polymorphic: true, null: false
      t.text :description

      t.timestamps
    end
  end
end
