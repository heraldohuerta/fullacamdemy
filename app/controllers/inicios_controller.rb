class IniciosController < ApplicationController
  before_action :authenticate_user!
  # before_action :authenticate_user, only: [:pag1, :pag2]
  # before_action :authenticate_user, except: [:pag3, :pag4]
  def Index
  end
end
