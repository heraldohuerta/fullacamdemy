class StudentsController < ApplicationController
load_and_authorize_resource :class => StudentsController
  def index
    @panel = Panel.select(:plan_id).where(user_id: current_user).group(:plan_id)
  end

  def detallecompra
     @compras = current_user.orders.where(status: true)
  end


  def test
    @test   = Test.find(params[:id])
    @questiontest = Questiontest.where(test_id: params[:id])
    @alternative  = @questiontest.first.alternatives
    @questiontype = Questiontype.all
  end

  def finalizar
      redirect_to students_path, notice: 'Se revisaran los resultados.'
  end
end
