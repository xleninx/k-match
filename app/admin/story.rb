ActiveAdmin.register Story do
  permit_params :title, :description, :image, :autor, :year
  menu  :priority => 98, :if => proc{ current_user.admin? }
  index do
    selectable_column
    id_column
    column :title
    column :description
    column :year
    column :autor
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
      f.inputs "Admin Details" do
        f.input :title
        f.input :description
        f.input :image, :as => :file
        f.input :autor
        f.input :year, :as => :select, :collection => [2010,2011,2012,2013,2014,2015]
      end
      f.actions
    end
end
