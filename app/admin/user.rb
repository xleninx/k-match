ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :country, :user_rigths, 
  :programs, :current_industry, :current_function, :commit, :authenticity_token,
  :country_id, :program_ids, :current_industry_id, :current_function_id, :user_rights, :utf8
  actions :all, :except => [:new, :delete]
  config.batch_actions = false

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :country
    column "Rigths", :rigths_string
    actions :defaults => false do |user|
      link_to "Delete", admin_user_path(user), :method => :delete, :data => {:confirm => "Are you sure?"}
    end 
  end

  filter :email
  filter :first_name
  filter :last_name



=begin

 form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :country
      f.input :programs
      f.input :current_industry
      f.input :current_function
      f.input :user_rights, :as => :select, :collection => Role.to_a
    end
    f.actions
  end
=end






  
end
