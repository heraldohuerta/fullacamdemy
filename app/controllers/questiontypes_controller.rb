class QuestiontypesController < InheritedResources::Base

  private

    def questiontype_params
      params.require(:questiontype).permit(:tipo, :descripcion)
    end
end

