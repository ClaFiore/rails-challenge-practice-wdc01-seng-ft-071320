class AddFloorTypeToOffice < ActiveRecord::Migration[5.1]
  def change
    change_column :offices, :floor, :integer
  end
end
