class BillingsController < ApplicationController
  load_and_authorize_resource
  before_action :find_master_order, only: [:execute,:pre_pay]

  def find_master_order
    @master_order = Order.where(user_id: current_user.id, status: false)
  end

  def execute
    master_order = @master_order.take
    paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    if paypal_payment.execute(payer_id: params[:PayerID])
        amount = paypal_payment.transactions.first.amount.total
        moneda = master_order.currency? ? master_order.currency : 'USD'
        code = paypal_payment.id
            billing = Billing.create!(code: code ,payment_method: 'paypal',amount: amount ,currency: moneda )

             master_order.status = true
             master_order.user_id = current_user.id
             master_order.billing_id =   billing.id
             master_order.total = amount
             if master_order.save
               redirect_to details_path, notice: "La compra se realizó con éxito!"

             # ESTO DETERMINA EL DETALLE DEL PANEL DE CONTROL DEL ALUMNO
              master_order.details.each do |d|
                d.plan.plans_options.each do |o|
                  Panel.create(user_id: d.user_id, plan_id:d.plan_id, option_id: o.option_id, cantidad_compra: o.option.cantidad, unit_id: o.option.unit_id)
                end
              end

            else
                redirect_to details_path, notice:'No se ha generado la compra, volver a intentar'
            end
    else
            redirect_to details_path, notice:'No se ha generado la compra, volver a intentar'
    end

  end

  def pre_pay
      order =    @master_order.take
      details = order.details

      total  = 0
      order.details.each do  |x|
          mul = x.quantity.to_i * x.price.to_i
          total = total +  mul
      end
      @total = total
      @items = details.map  do |items|
            item = {}
            item[:name]     = items.plan.descripcion
            item[:sku]      = items.id.to_s
            item[:price]    = items.price.to_s
            item[:currency] = order.currency? ? order.currency : 'USD'
            item[:quantity] = items.quantity
            item
      end

      payment = PayPal::SDK::REST::Payment.new(
          {
            :intent =>  "sale",
            :payer =>  {
              :payment_method =>  "paypal" },
            :redirect_urls => {
              :return_url => "https://fullacademy.herokuapp.com/billings/execute",
              :cancel_url => "https://fullacademy.herokuapp.com/" },
              # :return_url => "https://6caa4821.ngrok.io/billings/execute",
              # :cancel_url => "https://6caa4821.ngrok.io" },
            :transactions =>  [{
              :item_list => {
                :items => @items
              },
              :amount =>  {
                :total =>  @total.to_s,
                :currency => 'USD' },
              :description =>  "This is the payment transaction description." }]}
        )


      if payment.create
         redirect_url = payment.links.find{|v| v.method == "REDIRECT" }.href
          redirect_to redirect_url
          # redirect_to root_path, notice:'Se ha generado la compra, se ha enviado un correo con el detalle'
      else
        # render json: payment.error
        redirect_to details_path, notice:'No se ha generado la compra, volver a intentar'
      end

        #



 end

end
