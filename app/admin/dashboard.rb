ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
  # link rel:"stylesheet",href:"//netdna.bootstrapcdn.com/bootswatch/3.1.1/flatly/bootstrap.min.css"
  # link rel:"stylesheet",href:"//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
  # script src:"//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # div class: "container-fluid" do
    #     div class: "col-md-4" do
    #         div class: "well" do 
    #             p class: "text-center", style:"font-size:85px" do
    #                 "100"
    #             end
    #             p "recent"
    #         end
    #     end

    #     div class: "col-md-4" do
    #         div class: "well" do
    #             p class: "text-center", style:"font-size:85px" 
    #             p class: "text-center" 
    #         end    
    #     end    

    #     div class: "col-md-4" do
    #         div class: "well" do 
    #             p class: "text-center", style:"font-size:85px" 
    #             p class: "text-center" 
    #         end    
    #     end
    # end            

    # Here is an example of a simple dashboard with columns and panels.
    
    columns do
      column do
        panel "Recent Posts" do
          ul do
            User.all.map do |user|
              li link_to(user.first_name, profile_path)
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
