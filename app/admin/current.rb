ActiveAdmin.register User, :as => "current" do


  actions :all, :except => [:new, :delete]
  config.batch_actions = false

  scope_to {User.currents}

  index do
    selectable_column
    column :email
    column :first_name
    column :last_name
    column :country
    column :current_industry
    column :current_function
    column :grad_year
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :country
  
end
