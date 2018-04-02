class UnitsController < InheritedResources::Base

  private

    def unit_params
      params.require(:unit).permit(:codigo, :descripcion)
    end
end

