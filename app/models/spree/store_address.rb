module Spree
  class StoreAddress < Spree::Base
    self.table_name = 'spree_addresses_stores'

    belongs_to :store, class_name: 'Spree::Store', touch: true
    belongs_to :address, class_name: 'Spree::Address', touch: true

    validates :store, :address, presence: true
    validates :store_id, uniqueness: { scope: :address_id }

    scope :by_user_and_store, ->(user_id, store_id) { joins(:address).where(address: { user_id: user_id }).where(store_id: store_id) }
  end
end
