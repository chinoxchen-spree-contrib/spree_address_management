class CreateSpreeAddressesStores < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_addresses_stores do |t|
      t.bigint :address_id
      t.bigint :store_id

      t.timestamps
    end
  end
end
