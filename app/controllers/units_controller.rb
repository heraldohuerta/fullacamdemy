class UnitsController < InheritedResources::Base
load_and_authorize_resource
  private

    def unit_params
      params.require(:unit).permit(:codigo, :descripcion)
    end
end
