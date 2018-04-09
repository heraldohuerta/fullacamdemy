class QuestiontestsController < ApplicationController
load_and_authorize_resource
  def index
    @courses      = Course.all
    @questiontype = Questiontype.all
    @listest      = Test.all
  end



  def update
    arr = [:pregunta, :id]
    sw = 0
    arr.each do  |id|
        if !params[id].present?
          sw = 1
       end
    end

    if sw == 0
       opci = [:opcion0,:opcion1,:opcion2,:opcion3,:opcion4]
       resp = [:respuesta0,:respuesta1,:respuesta2,:respuesta3,:respuesta4]

       # valida que tenga al menos una respuesta
       opci.each do  |id|
           if params[:question][id].present?
             sw = 1
          end
       end

        if sw == 1
              @questiontest = Questiontest.find(params[:id])
              @questiontest.update(encunciado1: params[:pregunta])
              if @questiontest.save
                  @questiontest.alternatives.destroy_all
                        opci.each_with_index do  |campo,ind|
                              if !params[:question][campo].nil?
                                  Alternative.create(
                                          detallepregunta: params[:question][campo],
                                          respuesta:       params[:question][resp[ind]],
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



  def create
        arr = [:course_id,:asignatur_id,:content_id,:id,:questiontype_id,:encunciado1]
        sw = 0
        arr.each do  |id|
            if !params[:test][id].present?
              sw = 1
           end
        end

        if sw == 0
           opci = [:opcion0,:opcion1,:opcion2,:opcion3,:opcion4]
           resp = [:respuesta0,:respuesta1,:respuesta2,:respuesta3,:respuesta4]

           # valida que tenga al menos una respuesta
           opci.each do  |id|
               if params[:test][id].present?
                 sw = 1
              end
           end
            if sw == 1
              # @questiontype  = Questiontype.find(params[:questiontype])
              # @test         = Test.find(params[test][:id])
              @questiontest = Questiontest.new(question_params)
              @questiontest.test_id = params[:test][:id]


              if @questiontest.save

                opci.each_with_index do  |campo,ind|
                      if !params[:test][campo].nil?
                      Alternative.create(
                              detallepregunta: params[:test][campo],
                              respuesta:       params[:test][resp[ind]],
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

  def destroy
    @questiontest = Questiontest.find(params[:id]).destroy
    respond_to do |format|
        format.js
    end
    # redirect_to  vertest_path, notice: 'Registro ha sido borrado .'
  end

  private

  def question_params
    params.require(:test).permit(
      # :course_id,
      # :asignatur_id,
      # :content_id,
      # :id,
      :questiontype_id,
      :encunciado1
    )
  end


end
