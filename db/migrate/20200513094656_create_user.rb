class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string     :first_name, null: false, default: ''
      t.string     :last_name,  null: false, default: ''
      t.string     :email,      null: false, default: ''
      t.references :unit, index: true

      t.timestamps
    end
  end
end
