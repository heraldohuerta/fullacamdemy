class BillingsController < ApplicationController
  before_action :find_master_order, only: [:execute,:pre_pay]

  def find_master_order
    @master_order = Order.where(user_id: current_user.id, status: false)
  end

  def execute
    byebug
    master_order = @master_order.take

    paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    if paypal_payment.execute(payer_id: params[:PayerID])
        amount = paypal_payment.transactions.first.amount.total
        monto = amount.to_i
        moneda = master_order.currency? ? order.currency : 'USD'
        code = paypal_payment.id
            billing = Billing.create!(code: code ,payment_method: 'paypal',amount: monto ,currency: moneda )


             master_order.status = true
             master_order.user_id = current_user
             master_order.billing_id =   code
             master_order.total = monto
             if master_order.save
               redirect_to details_path, notice: "La compra se realizó con éxito!"
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
      @total =  order.details.map {|x| x.quantity.to_i * x.price.to_i }.compact
      @total = @total[0].to_i
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
              :return_url => "https://9a68ba45.ngrok.io/billings/execute",
              :cancel_url => "https://9a68ba45.ngrok.io/" },
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
         # redirect_to products_path, notice:'Se ha generado la compra, se ha enviado un correo con el detalle'
      else
        # render json: payment.error
        redirect_to details_path, notice:'No se ha generado la compra, volver a intentar'
      end

        #



 end

end
