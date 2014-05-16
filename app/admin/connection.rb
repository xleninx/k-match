ActiveAdmin.register Connection do

  permit_params :current_user_id, :prospective_user_id, :status, :message

 index do
    selectable_column
    column "Student", :current_user
    column "Prospective", :prospective_user
    column :status
    column :message
    column :created_at
    column :updated_at
    actions
  end

  filter :current_user
  filter :prospective_user
  filter :status, :as => :string 
  filter :create_at
  
end
