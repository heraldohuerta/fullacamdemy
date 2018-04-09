class QuestiontypesController < InheritedResources::Base
load_and_authorize_resource
  private

    def questiontype_params
      params.require(:questiontype).permit(:tipo, :descripcion)
    end
end
