ActiveAdmin.register User do
  actions :all, :except => [:new]
  config.batch_actions = false
  menu :priority => 10

  config.xlsx_builder.delete_columns :id, :user_rights,
      :country_id, :grad_year, :contact_count,
      :email, :encrypted_password, :reset_password_token,
      :reset_password_sent_at, :remember_created_at,
      :sign_in_count, :current_sign_in_at, :last_sign_in_at,
      :current_sign_in_ip, :last_sign_in_ip, :confirmation_token,
      :confirmed_at, :confirmation_sent_at, :created_at, :updated_at,
      :state,:interest_industry_id,
      :interest_function_id, :cancel_account_token

  config.xlsx_builder.column('Country') do |resource|
    (resource.country)? resource.country.name : ''
  end
  config.xlsx_builder.column('Current Industry') do |resource|
    (resource.current_industry)? resource.current_industry.name : ''
  end
  config.xlsx_builder.column('Current Function') do |resource|
    (resource.current_function)? resource.current_function.name : ''
  end

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :country
    column "Rigths", :user_rights
    actions :defaults => false do |user|
      link_to "Delete", admin_user_path(user), :method => :delete, :data => {:confirm => "Are you sure?"}
    end 
  end

  filter :email
  filter :first_name
  filter :last_name
  
end
