module Spree::StoreDecorator

  def self.prepended(base)
    base.has_many :store_addresses, class_name: 'Spree::StoreAddress'
    base.has_many :addresses, through: :store_addresses, class_name: 'Spree::Address'
  end
end

Spree::Store.prepend Spree::StoreDecorator
