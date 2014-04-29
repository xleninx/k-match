ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :country, :user_rigths, :user_rights

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :country
    column :rigths_string
    actions
  end

  filter :email
  filter :first_name
  filter :last_name

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :country
      f.input :user_rights
    end
    f.actions
  end

end
