ActiveAdmin.register_page "Prospective" do

    page_action :ex, :method => :post do
      # do stuff here
      redirect_to admin_prospective_path, :notice => "You did stuff!"
    end

    action_item do
      link_to "Do Stuff", admin_prospective_ex_path, :method => :post
    end

    content do
      para "Hello World"
    end
  end