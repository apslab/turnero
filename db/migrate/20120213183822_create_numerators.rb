class CreateNumerators < ActiveRecord::Migration
  def change
    create_table :numerators do |t|
      t.integer :init
      t.integer :current
      t.string :color
      t.string :name

      t.timestamps
    end
  end
end
