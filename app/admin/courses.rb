ActiveAdmin.register Course do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model


permit_params :nombre,
:detealle,
:tiempo,
:foto,
:costo,
:firmware_image


filter :nombre
filter :detealle
filter :created_at

index do
      column :id
      column :nombre
      column 'Detalle', :detealle
      column 'Tiempo', :tiempo
      column 'Avatar' do |a|
       image_tag(a.firmware_image.url(:medium),size: '100x150')
      end
      column 'Foto', :firmware_image do |asi|
       asi.firmware_image.original_filename
      end
      column  'Costo', :costo
      column 'Creado el ',:created_at
      actions
  end

#
form do |f|
    inputs 'Ingresar Curso' do
      f.input :nombre
      f.input :detealle
      f.input :firmware_image, :as => :file, :hint => f.object.firmware_image.present? \
          ? image_tag(f.object.firmware_image.url(:medium))
          : content_tag(:span, "Sin imagen aún")

      f.input :tiempo
      f.input :costo
    end
actions
end

show do |f|
  attributes_table do
    row :firmware_image do
        image_tag(f.firmware_image.url(:thumb))
        end
        row :nombre
        row :detealle
        row :tiempo
        row :costo
  end
end




  # controller do
  #
  #   def create
  #     byebug
  #     attrs = params[:course][:firmware_image]
  #     @course = Course.new(course_params)
  #     @course[:firmware_image_filename] = attrs.original_filename
  #     @course[:firmware_image] = attrs.read
  #     if @course.save
  #       redirect_to admin_course_path(@course)
  #     else
  #       render :new
  #     end
  #   end
  #
  #
  #   def course_params
  #       params.require(:course).permit(:url,:nombre,:detealle,:tiempo,:foto, :costo,:firmware_image,:firmware_image_filename)
  #   end
  #
  #
  # end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
