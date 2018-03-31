ActiveAdmin.register Questiontest do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :test_id, :questiontype_id, :encunciado1, :encunciado2
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


filter  :test_id,label:'Pruebas' ,as: :select,collection: proc { Test.pluck(:nombre, :id) }
filter :questiontype_id,label:'Tipo de Preguntas' ,as: :select,collection: proc { Questiontype.pluck(:tipo, :id) }

index do
      column :id
      column 'Primer Enunciado', :encunciado1
      column 'Segundo Enunciado', :encunciado2
      column 'Nombre Prueba', :test_id do |f|
       f.test.nombre
      end
      column 'Tipo Pregunta', :questiontype_id do |f|
       f.questiontype.tipo
      end
      column 'Creado el ',:created_at
      actions
  end



  form do |f|
      inputs 'Agregar Pregunta' do
        f.input  :test_id,label:'Pruebas' ,as: :select,collection: Test.pluck(:nombre, :id)
        f.input  :questiontype_id,label:'Tipo de Preguntas' ,as: :select,collection: Questiontype.pluck(:tipo, :id)
        f.input  :encunciado1,label:'Primer Enunciado'
        f.input  :enunciado2,label:'Segundo Enunciado'
      end
  actions
  end


end
