class OrdersController < ApplicationController
  load_and_authorize_resource
  def index

  end

  def create
      order = Order.where(user_id: current_user.id, status: false)
      plan = Plan.find(params[:plan_id])
      if order.count ==  0
          # Si no tiene ordenes abiertas genero una nueva
          orden = Order.create(user_id:current_user.id, status: false,currency:plan.moneda)
          number_order = orden.id
          master_order = orden

      else
          number_order = order.first.id
      end

      @detail = Detail.new
      @detail.plan_id = plan.id
      @detail.quantity = 1
      @detail.order_id = number_order
      @detail.price = plan.precio
      @detail.user = current_user
      @detail.moneda = plan.moneda
      if @detail.save
            redirect_to root_path, notice:'Se ha ingresado al carrito de compra'
      else
        redirect_to root_path, alert:'Problema al cargar carrito de compra'
      end

  end

end
