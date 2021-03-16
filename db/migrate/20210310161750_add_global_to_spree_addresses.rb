class AddGlobalToSpreeAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_addresses, :global, :boolean, default: false
  end
end
