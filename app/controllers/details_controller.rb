class DetailsController < ApplicationController
  before_action :authenticate_user!
# before_action :authenticate_user, only: [:pag1, :pag2]
# before_action :authenticate_user, except: [:pag3, :pag4]
# before_action :filter_admin!

def destroy
  borrar = Detail.find(params[:id])
  if !borrar.nil?
   borrar.destroy
    respond_to do |format|
      format.html { redirect_to details_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
 end
end

def pagar
    # master_order = MasterOrder.find(params[:id_order])
    # master_order.status = true
    # master_order.save
    # redirect_to products_path, notice:'Se ha generado la compra, se ha enviado un correo con el detalle'
end



def index
    carro = current_user.orders.where(status: false)
    @total = 0
    @details = []
    if carro.count > 0
      @details = carro.take.details
      @details.each do  |v|
        @total += ( v.price.to_i * v.quantity.to_i )
      end
    end
end

end
