ActiveAdmin.register Content do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
    inputs 'Agregar Contenido' do
      f.input :asignatur_id,label: 'Asignature',as: :select,collection: Asignatur.pluck(:nombre, :id)
      input :nombre
    end
actions
end


end
