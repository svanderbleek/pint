class CreatePints < ActiveRecord::Migration
  def change
    create_table :pints do |t|
      t.integer :price
      t.text :description
      t.integer :duration

      t.timestamps
    end
  end
end
