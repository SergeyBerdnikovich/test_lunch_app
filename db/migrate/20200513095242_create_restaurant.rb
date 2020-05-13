class CreateRestaurant < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name,    null: false, default: ''
      t.string :address, null: false, default: ''
    end
  end
end
