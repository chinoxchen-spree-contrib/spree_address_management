module Spree
  module AddressDecorator
    def self.prepended(base)
      base.scope :globals, -> { where(global: true, user_id: nil) }
    end
  end
end

::Spree::Address.prepend Spree::AddressDecorator
