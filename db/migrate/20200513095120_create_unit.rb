class CreateUnit < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.string :name, null: false, default: ''
    end
  end
end
