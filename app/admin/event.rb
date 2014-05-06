=begin
ActiveAdmin.register Event do
  permit_params :title, :description, :image, :month
  menu :priority => 100
  index do
    selectable_column
    id_column
    column :title
    column :description
    column :month
    column :created_at
    column :updated_at
    actions 
  end

  form do |f|
      f.inputs "Admin Details" do
        f.input :title
        f.input :description
        f.input :image, :as => :file
        f.input :month, :as => :select, :collection => Date::MONTHNAMES.compact
      end
      f.actions
    end
end
=end
