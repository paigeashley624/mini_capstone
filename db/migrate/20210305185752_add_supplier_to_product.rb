class AddSupplierToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :supplier, :integer
  end
end
