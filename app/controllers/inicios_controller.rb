class IniciosController < ApplicationController
  # before_action :authenticate_user!
  # before_action :authenticate_user!, only: [:pag1, :pag2]
   before_action :authenticate_user!, except: [:index,:show]
  def index
    @total = 0
    if user_signed_in?
        carro = current_user.orders.where(status: false)

        @details = []
        if carro.count > 0
          @details = carro.take.details
          @details.each do  |v|
            @total += ( v.price.to_i * v.quantity.to_i )
          end
        end
   end

    @plans = Plan.all
    @plan  = Plan.new
  end

  def show
     @plan = Plan.find(params[:id])
  end

  def detallecompra
     @compras = current_user.orders.where(status: true)
  end
end
