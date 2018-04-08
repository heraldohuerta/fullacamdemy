class BillingsController < ApplicationController
  before_action :find_mater_order, only: [:execute,:pre_pay]

  def find_mater_order
    @master_order = Order.where(user_id: current_user.id, status: false)
  end

  def execute
    paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    if paypal_payment.execute(payer_id: params[:PayerID])

            amount = paypal_payment.transactions.first.amount.total

            billing = Billing.create(
                user: current_user,
                code: paypal_payment.id,
                payment_method: 'paypal',
                amount: amount,
                currency: 'USD'
              )

             master_order = @master_order
             master_order.status = true
             master_order.billing_id =   billing.id
             master_order.total = amount
             master_order.save
             redirect_to products_path, notice: "La compra se realizó con éxito!"


    else
            redirect_to products_path, notice:'No se ha generado la compra, volver a intentar'
    end

  end

  def pre_pay
      @master_order = Order.where(user_id: current_user.id, status: false).take
      master_order = @master_order
      details = master_order.details
      @total =  orders.pluck("price * quantity").sum()

      @items = details.map  do |order|
            item = {}
            item[:name] = order.product.name
            item[:sku] = order.id.to_s
            item[:price] = order.price.to_s
            item[:currency] = 'USD'
            item[:quantity] = order.quantity
            item
      end

      payment = PayPal::SDK::REST::Payment.new(
          {
            :intent =>  "sale",
            :payer =>  {
              :payment_method =>  "paypal" },
            :redirect_urls => {
              :return_url => "https://paypal39.herokuapp.com/billings/execute",
              :cancel_url => "https://paypal39.herokuapp.com/" },
            :transactions =>  [{
              :item_list => {
                :items => @items},
              :amount =>  {
                :total =>  @total.to_s,
                :currency =>  "USD" },
              :description =>  "This is the payment transaction description." }]}
        )


      if payment.create
         redirect_url = payment.links.find{|v| v.method == "REDIRECT" }.href
         redirect_to redirect_url
         # redirect_to products_path, notice:'Se ha generado la compra, se ha enviado un correo con el detalle'
      else
        # render json: payment.error
        redirect_to products_path, notice:'No se ha generado la compra, volver a intentar'
      end

        #



 end

end
