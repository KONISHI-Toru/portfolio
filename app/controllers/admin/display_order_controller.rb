module Admin
  class DisplayOrderController < Admin::ApplicationController
    def order
      @order ||= Administrate::Order.new(
        params.fetch(resource_name, {}).fetch(:order, 'display_order'),
        params.fetch(resource_name, {}).fetch(:direction, 'asc'),
      )
    end
  end
end
