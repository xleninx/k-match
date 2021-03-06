ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      # span class: "blank_slate" do
      #   span I18n.t("active_admin.dashboard_welcome.welcome")
      #   small I18n.t("active_admin.dashboard_welcome.call_to_action")
      # end
    end

    avg = Connection.avg_connection

    div class: "col-sm-4" do
        div class: "well" do
            span class: "title-module" do
                User.where(:user_rights => Role::PROSPECTIVE).count
            end
            span class: "description-module" do
                "Registered Prospective Students"
            end
        end
    end

    div class: "col-sm-4" do
        div class: "well" do
            span class: "title-module" do
                Connection.where(:status => "established").count
            end
            span class: "description-module" do
                "Connection Request"
            end
        end
    end

    div class: "col-sm-4" do
        div class: "well" do
            span class: "title-size" do avg[:days] end 
            span class: "description-size" do "day" end
            span class: "title-size" do avg[:hours] end 
            span class: "description-size" do "hour" end
            span class: "title-size" do avg[:minutes] end
            span class: "description-size" do "mins." end

            span class: "description-module" do
                "Average time for a completed connection request"
            end
        end
    end

    hr

    h3 "Requests per program"

    div class: "col-sm-12 text-center" do 
        Program.all.each do |p|
            div class: "col-sm-2", style: "margin-left:35px" do
                span class: "title-program" do p.users.count end

                span class: "title-description" do "Program #{p.name}" end
                hr style: " border: 1px solid \##{rand(0xffffff).to_s(16)};"
            end
        end
    end 

  end # content
end
