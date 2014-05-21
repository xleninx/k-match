ActiveAdmin.register Club, :as => "club" do
  menu :parent => "Data", :if => proc{ current_user.leader? }
  permit_params :name, :type_club
  config.batch_actions = true
  actions :all
  index do
    selectable_column
    column :name
    column :type_club
  end

  filter :name
  filter :type_club

  form do |f|  
    f.inputs do
      f.input :type_club, :collection => ['Professional','Affinity']
      f.input :name
    end
    f.actions
  end
  
end
