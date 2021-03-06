ActiveAdmin.register User do
  actions :all, :except => [:new]
  config.batch_actions = false
  menu :priority => 10
  scope :joined, :default => true do |users|
    users.includes [:country,:current_industry,:current_function]
  end

  config.xlsx_builder.delete_columns :id, :user_rights,
      :grad_year, :contact_count,
      :encrypted_password, :reset_password_token,
      :reset_password_sent_at, :remember_created_at,
      :sign_in_count, :current_sign_in_at, :last_sign_in_at,
      :current_sign_in_ip, :last_sign_in_ip, :confirmation_token,
      :confirmed_at, :confirmation_sent_at, :created_at, :updated_at,
      :cancel_account_token

  fields_belong = {country: 'Country',
          current_industry: 'Current Industry',
          current_function: 'Current Function',
          interest_function: 'Interest Function',
          interest_industry: 'Interest Industry'}

  fields_belong.each do |key, value|
    config.xlsx_builder.column(value) do |resource|
      source = resource.send(key.to_s)
      (source)? source.name : ''
    end
  end

  fields_has_many = {clubs: 'Clubs' ,programs: 'Programs'}

  fields_has_many.each do |key, value|
    config.xlsx_builder.column(value) do |resource|
      names = []
      resource.send(key.to_s).each{|x| names << x.name }
      names.join(',')
    end
  end

  index do
    selectable_column

    id_column
    column :email
    column :first_name
    column :last_name
    column :country, sortable: 'countries.name'
    column :state
    column "Rigths", :user_rights
    column :programs  do |user|
      names = []
      user.programs.each do |program|
        names << program.name
      end
      names.join(',')
    end
    actions :defaults => false do |user|
      link_to "Delete", admin_user_path(user), :method => :delete, :data => {:confirm => "Are you sure?"}
    end 
  end

  filter :email
  filter :first_name
  filter :last_name
  
end
