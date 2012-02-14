class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.integer :numerator_id
      t.integer :number
      t.datetime :called

      t.timestamps
    end
  end
end
