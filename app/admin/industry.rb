ActiveAdmin.register Industry, :as => "industries" do
  menu :parent => "Data", :if => proc{ current_user.leader? }
  actions :all
  permit_params :name
  config.batch_actions = true

  index do
    selectable_column
    column :name
  end

  filter :name
  
end