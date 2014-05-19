ActiveAdmin.register Video do
  permit_params :title, :url, :position
  config.batch_actions = false
  menu  :priority => 100, :if => proc{ current_user.leader? }
  index do
    selectable_column
    id_column
    column :title
    column :url
    column :position
    column :created_at
    column :updated_at
    actions 
  end

  form do |f|
      f.inputs "Admin Details" do
        f.input :title
        f.input :url
        f.input :position,  :as => :select, :collection => VideoType.to_a
      end
      f.actions
    end
end
