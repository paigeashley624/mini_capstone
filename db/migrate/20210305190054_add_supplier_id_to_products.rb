class AddSupplierIdToProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :supplier, :integer
  end
end
