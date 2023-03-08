module Spree
  module AddressDecorator
    def self.prepended(base)
      base.scope :show_in_frontend, -> { where(hide_in_frontend: false) }
      base.scope :hide_in_frontend, -> { where(hide_in_frontend: true) }
      base.has_many :store_addresses, class_name: 'Spree::StoreAddress'
      base.has_many :stores, through: :store_addresses, class_name: 'Spree::Store'

      base.scope :globals, -> { where(global: true, user_id: nil) }
    end
  end
end

::Spree::Address.prepend Spree::AddressDecorator
