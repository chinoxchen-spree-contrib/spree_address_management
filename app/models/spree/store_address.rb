module Spree
  class StoreAddress < Spree::Base
    self.table_name = 'spree_addresses_stores'

    belongs_to :store, class_name: 'Spree::Store', touch: true
    belongs_to :address, class_name: 'Spree::Address', touch: true

    validates :store, :address, presence: true
    validates :store_id, uniqueness: { scope: :address_id }
  end
end
