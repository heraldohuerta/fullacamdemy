ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #

  permit_params  :email,
  :password,
  :email,
  :rut,
  :nombres,
  :apellidos,
  :edad,
  :bio ,
  :foto ,
  :correo,
  :telefoniafija ,
  :telefoniamovil ,
  :ultimocurso ,
  :colegio ,
  :nombrecontacto1,
  :fonocontacto1,
  :nombrecontacto2 ,
  :fonocontacto2 ,
  :admin,
  :avatar

  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end



  filter  :email
  filter  :password
  filter  :rut
  filter  :nombres
  filter  :apellidos
  filter  :edad
  filter  :bio
  filter  :correo
  filter  :telefoniafija
  filter  :telefoniamovil
  filter  :ultimocurso
  filter  :colegio
  filter  :nombrecontacto1
  filter  :fonocontacto1
  filter  :nombrecontacto2
  filter  :fonocontacto2

  index do |f|

    column 'Avatar' do |a|
     image_tag(a.avatar.url(:medium),size: '100x150')
    end
    column  :email
    column  :password
    column  :rut
    column  :nombres
    column  :apellidos
    column  :edad
    column  :bio
    column  :correo
    column  :telefoniafija
    column  :telefoniamovil
    column  :ultimocurso
    column  :colegio
    column  :nombrecontacto1
    column  :fonocontacto1
    column  :nombrecontacto2
    column  :fonocontacto2
    column  :admin
        actions
    end







  form do |f|
      inputs 'Ingresar Usuario' do
        f.input :email
        f.input :password
        f.input :password_confirmation
        f.input :rut
        f.input :nombres
        f.input :apellidos
        f.input :edad
        f.input :bio
        f.input :avatar, :as => :file, :hint => f.object.avatar.present? \
            ? image_tag(f.object.avatar.url(:medium))
            : content_tag(:span, "Sin imagen aún")
        f.input :correo
        f.input :telefoniafija
        f.input :telefoniamovil
        f.input :ultimocurso
        f.input :colegio
        f.input :nombrecontacto1
        f.input :fonocontacto1
        f.input :nombrecontacto2
        f.input :fonocontacto2
        f.input :admin
      end
      actions
  end






  controller do
    def update
        if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
            params[:user].delete("password")
          params[:user].delete("password_confirmation")
        end
      super
    end
  end
end
