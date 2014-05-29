ActiveAdmin.register Connection do

  permit_params :current_user_id, :prospective_user_id, :status, :message
  scope :joined, :default => true do |connection|
    connection.includes [:prospective_user,:current_user]
  end

  fields_belong = { current_user: 'User',
                    prospective_user: 'Prospective'
                  }

  fields_belong.each do |key, value|
    config.xlsx_builder.column(value) do |resource|
      source = resource.send(key.to_s)
      (source)? source.full_name : ''
    end
  end

 index do
    selectable_column
    column "User" do |post|
      name = (post.current_user)? post.current_user.full_name : ''
      if post.current_user
        link_to name, (post.current_user.leader?)? admin_user_path(post.current_user) : admin_student_path(post.current_user)
      else
        ''
      end
    end
    column "Prospective" do |post|
      name = (post.prospective_user)? post.prospective_user.full_name : ''
      if post.prospective_user
        link_to name, admin_prospective_path(post.prospective_user)
      else
        ''
      end
    end
    column :message
    column :status
    column :created_at
    column :updated_at
    actions
  end

  filter :current_user
  filter :prospective_user
  filter :status, :as => :string 
  filter :create_at
  
end
