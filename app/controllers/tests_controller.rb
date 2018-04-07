class TestsController < ApplicationController
  attr_accessor :prueba
  before_action :ini

  def updated
    @test = Test.find(params[:test][:id])
    if @test.update(param_test)
         redirect_to  tests_path, notice: 'La prueba se ha actualizado!'
     else
         redirect_to  tests_path, alert: 'Problemas al actualizar!'
     end
  end



  def create
        if  params[:test][:course_id].nil?  ||
            params[:test][:asignatur_id].nil? ||
            params[:test][:content_id].nil? ||
            params[:test][:puntajemax].nil? ||
            params[:test][:puntajeapro].nil? ||
            params[:test][:detalle].nil? ||
            params[:test][:url_file].nil?
            redirect_to  tests_path, notice: 'Faltan datos por Ingresar .'
        else
          # Debido a la forma dinamica del formulario Rail no es capaz de mandar
          # solo al metodo update, por lo cual se fuerza esta opcion

          if  params[:test][:id].present? && params[:test][:id] != "0"
            updated()
          else
               if Test.create(param_test)
                 redirect_to  tests_path, notice: 'La prueba se ha creado!'
               else
                 redirect_to  tests_path, alert: 'Problemas crear!'
              end
          end
        end
  end





  def ini
    @@prueba = 'Seleccione prueba'
  end

  def  completarasignatura

    @asignatura =   Asignatur.where(course_id: params[:course_id])
  end

  def completarcontenido
     @contenido =   Content.where(asignatur_id: params[:asignatur_id])
  end

  def completarprueba
     @prueba =   Test.where(content_id: params[:content_id])
  end

  def buscarprueba
    if params[:test_id].present?
     @test =   Test.find(params[:test_id])
   end

  end



  def index
       @courses      = Course.all
        @test        = Test.new
       @questiontype = Questiontype.all
       @listest      = Test.all
  end



  def vertest
    @courses = Course.all
  end

  def armartest
    test_id = params[:test_id] if params[:test_id].present?
    @test   = Test.find(test_id) if !test_id.nil?
    @questiontest = Questiontest.where(test_id: params[:test_id])
    @alternative  = @questiontest.first.alternatives
    @questiontype = Questiontype.all
   # redirect_to vertest_path
  end





  private

  def param_test
    params.require(:test).permit(
      :nombre,
      :course_id,
      :asignatur_id,
      :content_id,
      :puntajemax,
      :puntajeapro,
      :detalle,
      :url_file
    )
  end
end
