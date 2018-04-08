class IniciosController < ApplicationController
  # before_action :authenticate_user!
  # before_action :authenticate_user!, only: [:pag1, :pag2]
   before_action :authenticate_user!, except: [:index,:show]
  def index
    @plans = Plan.all
    @plan  = Plan.new
  end

  def show

    @plan = Plan.find(params[:id])

  end
end
