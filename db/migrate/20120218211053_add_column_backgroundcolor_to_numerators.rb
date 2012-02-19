class AddColumnBackgroundcolorToNumerators < ActiveRecord::Migration
  def change
    add_column :numerators, :backgroundcolor, :string

  end
end
