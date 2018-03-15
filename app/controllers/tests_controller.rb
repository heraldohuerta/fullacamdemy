class TestsController < ApplicationController
  attr_accessor :prueba
  before_action :ini

  def ini
      byebug
    @@prueba = 'Seleccione prueba'
  end

  def  completarasignatura
    byebug
    @asignaturas =   Asignature.where(course_id: params[:course_id])
  end

  def completarcontenido
    byebug
     @contenido =   Content.where(asignatur_id: params[:asignatur_id])
  end

  def tests
      @courses  = Course.all

      @test = Test.new
      @questiontype = Questiontype.all
      @listest = Test.all
      if params[:id_prueba].nil?
        @prueba_ingresada = @@prueba
      else
        @prueba_ingresada = Test.find(params[:id_prueba]).nombre
      end
  end
    def grabar_question
      byebug

      if params[:prueba][:encunciado1].nil?
        redirect_to test_path, notice: 'Ingrese Pregunta.'
      end

      cont = 0
      5.times do |i|
        opci = "opcion#{i}"
        resp = "respuesta#{i}"
        if params[:prueba][opci].nil?
          cont = cont + 1
        end
      end
      if cont == 5
        redirect_to test_path, notice: 'No puede haber pregunta sin una respuesta.'
      end
    end


  def grabar_test
    byebug

    if params[:test][:nombre].nil?
      redirect_to test_path, notice: 'Ingrese Nombre de Prueba.'
    end


    #
    # 5.times do |i|
    #   opci = "opcion#{i}"
    #   resp = "respuesta#{i}"
    #   Aalternative.created()
    # end
    #
    # create_table "alternatives", force: :cascade do |t|
    #   t.string "detallepregunta"
    #   t.boolean "respuesta"
    #   t.bigint "questiontest_id"
    # end
    # create_table "questiontests", force: :cascade do |t|
    #   t.string "encunciado1"
    #   t.string "enunciado2"
    #   t.bigint "test_id"
    #   t.bigint "questiontypes_id"
    # end
    #
    # create_table "tests", force: :cascade do |t|
    #   t.string "nombre"
    #   t.string "puntajemax"
    #   t.string "puntajeapro"
    #   t.string "detalle"
    #   t.string "archivo"
    #   t.string "url_file"
    #   t.bigint "content_id"
    #   t.bigint "asignatur_id"
    #   t.bigint "course_id"
    # end

    # asignaturs
    # contents
    # courses
    #
    # create_table "asignaturs", force: :cascade do |t|
    #   t.string "nombre"
    #   t.bigint "course_id"
    # end
    #
    # create_table "contents", force: :cascade do |t|
    #   t.string "nombre"
    #   t.string "detalle"
    #   t.string "archivo"
    #   t.string "url_file"
    #   t.bigint "asignatur_id"
    # end

    # create_table "courses", force: :cascade do |t|
    #   t.string "nombre"
    #   t.string "detealle"
    #   t.string "tiempo"
    #   t.string "foto"
    #   t.string "costo"
    # end

    # create_table "questiontypes", force: :cascade do |t|
    #   t.string "tipo"
    #   t.string "descripcion"
    # end




    # params[:prueba][:opcion0]
    # params[:prueba][:respuesta0]


    # @test
    # @questiontest
    # @questiontype
    # @alternative


    Test.create(nombre: params[:test][:nombre])
    @@prueba  = params[:test][:nombre]
    redirect_to test_path
  end


  def insert
    byebug
  end

  def questiontests
  end

  def questiontypes
  end
end
