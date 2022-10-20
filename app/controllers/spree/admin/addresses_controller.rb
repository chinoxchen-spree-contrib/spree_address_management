module Spree
  module Admin
    class AddressesController < ResourceController
      helper Spree::Admin::AddressesHelper
      before_action :set_counties
      before_action :set_stores

      def new
        @address = Spree::Address.default
      end

      private

      def find_resource
        Spree::Address.find(params[:id])
      end

      def collection
        params[:q] = {} if params[:q].blank?
        store = current_store.partner? ? Spree::Store.default : current_store
        @search = store.addresses.globals.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(params[:per_page])
      end

      def set_counties
        @counties = Spree::State.find_by(abbr: 'RM').counties.sort
      end

      def set_stores
        @stores = Spree::Store.all
      end
    end
  end
end
