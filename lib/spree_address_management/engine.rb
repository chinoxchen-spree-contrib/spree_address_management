module SpreeAddressManagement
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_address_management'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      unless Spree::PermittedAttributes.address_attributes.include?(:latitude)
        Spree::PermittedAttributes.address_attributes << :latitude
      end

      unless Spree::PermittedAttributes.address_attributes.include?(:longitude)
        Spree::PermittedAttributes.address_attributes << :longitude
      end

      unless Spree::PermittedAttributes.stock_location_attributes.include?(:latitude)
        Spree::PermittedAttributes.stock_location_attributes << :latitude
      end

      unless Spree::PermittedAttributes.stock_location_attributes.include?(:longitude)
        Spree::PermittedAttributes.stock_location_attributes << :longitude
      end

      unless Spree::PermittedAttributes.address_attributes.include?(:hide_in_frontend)
        Spree::PermittedAttributes.address_attributes << :hide_in_frontend
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
