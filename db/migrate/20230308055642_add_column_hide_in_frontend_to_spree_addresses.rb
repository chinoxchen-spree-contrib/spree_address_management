class AddColumnHideInFrontendToSpreeAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_addresses, :hide_in_frontend, :boolean, default: false
  end
end
