class AddColumnPositionIdToNumbers < ActiveRecord::Migration
  def change
    add_column :numbers, :position_id, :integer

  end
end
