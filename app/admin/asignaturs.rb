ActiveAdmin.register Asignatur do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :nombre,:course_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
      column :id
      column 'Nombre Asignatura', :nombre
      column 'Creado el ',:created_at
      column :course_name do |asi|
       asi.course.nombre
      end
      actions
  end

  filter :course_id ,as: :select,collection: proc { Course.pluck(:nombre, :id) }
  filter :nombre
  filter :created_at

#
form do |f|
    inputs 'Agregar Asingnatura' do
      f.input :course_id,label: 'Curso',as: :select,collection: Course.pluck(:nombre, :id)
      input :nombre
    end
actions
end

end
