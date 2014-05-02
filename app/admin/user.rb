# ActiveAdmin.register User do
#   permit_params :email, :first_name, :last_name, :country, :user_rigths, 
#   :programs, :current_industry, :current_function, :commit, :authenticity_token,
#   :country_id, :program_ids, :current_industry_id, :current_function_id, :user_rights, :utf8
#   actions :all, :except => [:new, :delete]
#   config.batch_actions = false

#   index do
#     selectable_column
#     id_column
#     column :email
#     column :first_name
#     column :last_name
#     column :country
#     column :rigths_string
#     actions :defaults => false do |user|
#       link_to "View", admin_user_path(user)
#       link_to "Edit", edit_admin_user_path(user)
#     end 
#   end

#   filter :email
#   filter :first_name
#   filter :last_name

#   form do |f|
#     f.inputs "Admin Details" do
#       f.input :email
#       f.input :first_name
#       f.input :last_name
#       f.input :country
#       f.input :programs
#       f.input :current_industry
#       f.input :current_function
#       f.input :user_rights, :as => :select, :collection => Role.to_a
#     end
#     f.actions
#   end


  
# end
