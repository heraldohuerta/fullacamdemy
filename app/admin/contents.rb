ActiveAdmin.register Content do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :nombre,
 :detalle,
 :archivo,
 :url_file,
 :asignatur_id,
 :course_id

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#




 filter :course_id , :as => :select,  collection: -> {
    Course.all.map { |dev| [dev.nombre, dev.id] } }

 filter :asignatur_id , :as => :select,  collection: -> {
       Asignatur.all.map { |dev| [dev.nombre, dev.id] } }

# filter :tests_id , :as => :select,  collection: -> {
#              Test.all.map { |dev| [dev.nombre, dev.id] } }

#  filter :asignatur_nombre , :as => :string
# # filter :content_nombre_contains , :as => :string
#  filter :tests_nombre_contains , :as => :string

form do |f|
    inputs 'Agregar Contenido' do
      f.input :course_id,label: 'Curso',as: :select,collection: Course.pluck(:nombre, :id)
      f.input :asignatur_id,label: 'Asignatura',as: :select,collection: Asignatur.pluck(:nombre, :id)
      input :nombre
      input :detalle
      input :url_file

    end
actions
end


end
