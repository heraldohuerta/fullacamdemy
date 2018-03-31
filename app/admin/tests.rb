ActiveAdmin.register Test do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :nombre, :puntajemax, :puntajepro, :detalle, :archivo,  :url_file, :content_id, :asignatur_id, :course_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


filter :course_id,label:'Curso' ,as: :select,collection: proc { Course.pluck(:nombre, :id) }
filter :asignatur_id,label:'Asignatura' ,as: :select,collection: proc { Asignatur.pluck(:nombre, :id) }
filter :content_id,label:'Contenido' ,as: :select,collection: proc { Content.pluck(:nombre, :id) }
filter :nombre
filter :detalle
filter :archivo
filter :url_file





    index do
      column :id
      column :nombre
      column :puntajemax
      column :puntajeapro
      column :detalle
      column :url_file do |f|
         link_to(f.url_file,f.url_file) if !f.url_file.nil?
      end

      column 'Cotenido', :content_id do |f|
        f.content.nombre
      end

      column 'Asignatura', :asignatur_id do |f|
        f.asignatur.nombre
      end

      column 'Curso', :course_id do |f|
        f.course.nombre
      end
      column 'Creado el ',:created_at
      actions
    end


end
