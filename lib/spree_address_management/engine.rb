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

      unless Spree::PermittedAttributes.address_attributes.include?(:latitud)
        Spree::PermittedAttributes.address_attributes << :latitud
      end

      unless Spree::PermittedAttributes.address_attributes.include?(:longitud)
        Spree::PermittedAttributes.address_attributes << :longitud
      end

      unless Spree::PermittedAttributes.stock_location_attributes.include?(:latitud)
        Spree::PermittedAttributes.stock_location_attributes << :latitud
      end

      unless Spree::PermittedAttributes.stock_location_attributes.include?(:longitud)
        Spree::PermittedAttributes.stock_location_attributes << :longitud
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
