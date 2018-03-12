ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #

  permit_params :email, :password,  :email,
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
  :admin

  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    input :email
    input :password
    input :rut
    input :nombres
    input :apellidos
    input :edad
    input :bio
    input :foto
    input :correo
    input :telefoniafija
    input :telefoniamovil
    input :ultimocurso
    input :colegio
    input :nombrecontacto1
    input :fonocontacto1
    input :nombrecontacto2
    input :fonocontacto2
    input :admin
  actions 
  end


  controller do
    def update
      if (params[:user][:password].blank? && params[:user]
        [:password_confirmation].blank?)
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end
end
