class CreateGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.integer    :leader_id,  index: true
      t.references :restaurant, index: true
      t.references :event,      index: true

      t.timestamps
    end
  end
end
