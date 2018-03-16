class TestsController < ApplicationController
  attr_accessor :prueba
  before_action :ini

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
     @test =   Test.find(params[:test_id])
  end

def questiontest
  @courses      = Course.all
  # @test         = Test.new
  @questiontype = Questiontype.all
  @listest      = Test.all
 # if params[:id_prueba].nil?
 #   @prueba_ingresada = @@prueba
 # else
 #   @prueba_ingresada = Test.find(params[:id_prueba]).nombre
 # end
end

  def tests
       @courses      = Course.all
       # @test         = Test.new
       @questiontype = Questiontype.all
       @listest      = Test.all
      # if params[:id_prueba].nil?
      #   @prueba_ingresada = @@prueba
      # else
      #   @prueba_ingresada = Test.find(params[:id_prueba]).nombre
      # end
  end

def grabar_question
      arr = [:curso,:asignatura,:contenido,:listest,:questiontype,:pregunta]
      sw = 0
      arr.each do  |id|
          if !params[id].present?
            sw = 1
         end
      end

      if sw == 0

        # "curso"=>"4",
        # "asignatura"=>"2",
        # "contenido"=>"2",
        # "listest"=>"28",
        # "questiontype"=>"2",
        # "pregunta"=>"PREGUNTA",
        #

         # params[:curso]
         # params[:asignatura]
         # params[:contenido]
         # params[:listest]
         # params[:questiontype]
         # params[:pregunta]
         opci = [:opcion0,:opcion1,:opcion2,:opcion3,:opcion4]
         resp = [:respuesta0,:respuesta1,:respuesta2,:respuesta3,:respuesta4]

         # valida que tenga al menos una respuesta
         opci.each do  |id|
             if params[:test2][id].present?
               sw = 1
            end
         end


        # params[:tests][:opcion0]
        # params[:tests][:opcion1]
        # params[:tests][:opcion2]
        # params[:tests][:opcion3]
        # params[:tests][:opcion4]
        #
        # params[:tests][:respuesta0]
        # params[:tests][:respuesta1]
        # params[:tests][:respuesta2]
        # params[:tests][:respuesta3]
        # params[:tests][:respuesta4]

          if sw == 1
            byebug
            @questiontype  = Questiontype.find(params[:questiontype])
            @test         = Test.find(params[:listest])
            @questiontest = Questiontest.new(encunciado1: params[:pregunta],test_id: @test,questiontypes_id: @questiontype)
            if @questiontest.save

              opci.each_with_index do  |campo,ind|
                    if !params[:test2][campo].nil?
                    Alternative.create(
                            detallepregunta: params[:test2][campo],
                            respuesta:       params[:test2][resp[ind]],
                            questiontest_id: @questiontest.id )
                  end
              end
            end
          end
      end
      respond_to do |format|
          format.js
      end
end


  def grabar_test

    if  params[:curso].nil?  ||
        params[:asignatura].nil? ||
        params[:contenido].nil? ||
        params[:test][:puntajemax].nil? ||
        params[:test][:puntajeapro].nil? ||
        params[:test][:detalle].nil? ||
        params[:test][:url_file].nil?
        redirect_to test_path, notice: 'Faltan datos por Ingresar .'
    else


        if  !params[:pruebas].present? && !params[:test][:nombre].present?
          redirect_to test_path, notice: 'Ingrese Nombre de Prueba o seleccione Alguna Existente .'
        end

        if params[:pruebas].present?
          prueba = params[:pruebas]
        end

        if params[:test][:nombre].present?
          nombre_test = params[:test][:nombre]
        end

        contenido = params[:contenido]
        asignatura = params[:asignatura]
        curso     = params[:curso]
        puntaje_max = params[:test][:puntajemax]
        puntaje_apr = params[:test][:puntajeapro]
        detalle_test = params[:test][:detalle]
        url_test = params[:test][:url_file]


        Test.create(nombre: params[:test][:nombre], content_id: contenido, asignatur_id:asignatura, course_id:curso)
        @@prueba  = params[:test][:nombre]
        redirect_to test_path
      end

  end


  def insert
    byebug
  end

  def questiontests
  end

  def questiontypes
  end
end
