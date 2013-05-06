class PintsTags < ActiveRecord::Migration
  def change
    create_table :pints_tags do |t|
      t.belongs_to :pint
      t.belongs_to :tag
    end
  end
end
