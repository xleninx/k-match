ActiveAdmin.register Connection do
 index do
    selectable_column
    column "Receives Request", :current_user
    column "Sends Request", :prospective_user
    column :status
    column :message
    column :created_at
    actions
  end

  filter :current_user
  filter :prospective_user
  filter :status, :as => :string 
  filter :create_at
  
end
