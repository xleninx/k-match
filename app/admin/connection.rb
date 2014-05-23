ActiveAdmin.register Connection do

  permit_params :current_user_id, :prospective_user_id, :status, :message
  scope :joined, :default => true do |connection|
    connection.includes [:prospective_user,:current_user]
  end
 index do
    selectable_column
    column "User" do |post|
      name = (post.current_user)? post.current_user.full_name : ''
      if post.current_user
        link_to name, admin_user_path(post.current_user)
      else
        ''
      end
    end
    column "Prospective", :prospective_user
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
