module Spree
  module Admin
    class AddressesController < ResourceController
      helper Spree::Admin::AddressesHelper
      before_action :counties

      def new
        @address = Spree::Address.default
      end

      private

      def find_resource
        Spree::Address.find(params[:id])
      end

      def collection
        params[:q] = {} if params[:q].blank?
        address = super
        @search = address.globals.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(params[:per_page])
      end

      def counties
        @counties = Spree::State.find_by(abbr: 'RM').counties.sort
      end
    end
  end
end
