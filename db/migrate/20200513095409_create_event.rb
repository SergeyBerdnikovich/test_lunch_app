class CreateEvent < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name,   null: false, default: ''
      t.string :status, null: false, default: ''

      t.timestamps
    end
  end
end
