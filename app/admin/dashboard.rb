ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      # span class: "blank_slate" do
      #   span I18n.t("active_admin.dashboard_welcome.welcome")
      #   small I18n.t("active_admin.dashboard_welcome.call_to_action")
      # end
    end

    div class: "col-sm-4" do
        div class: "well" do
            span class: "title-module" do
                User.where(:user_rights=> 3).count
            end
            span class: "description-module" do
                "Registered Prospective Students"
            end
        end
    end

    div class: "col-sm-4" do
        div class: "well" do
            span class: "title-module" do
                "250"
            end
            span class: "description-module" do
                "Conection Request"
            end
        end
    end

    div class: "col-sm-4" do
        div class: "well" do
            span class: "title-size" do "1" end 
            span class: "description-size" do "hour" end
            span class: "title-size" do "12" end
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
            div class: "col-sm-2" do
                span class: "title-program" do p.users.count end

                span class: "title-description" do "Program #{p.name}" end
                hr style: "margin: 20px 35px; border: 1px solid \##{rand(0xffffff).to_s(16)};"
            end
        # div class: "col-sm-2" do
        #     span class: "title-program" do "1" end

        #     span class: "title-description" do "1" end
        #     hr style: "margin: 20px 35px; border: 1px solid green;"
        # end
        # div class: "col-sm-2" do
        #     span class: "title-program" do "1" end

        #     span class: "title-description" do "1" end
        #     hr style: "margin: 20px 35px; border: 1px solid green;"
        # end
        # div class: "col-sm-2" do
        #     span class: "title-program" do "1" end

        #     span class: "title-description" do "1" end
        #     hr style: "margin: 20px 35px; border: 1px solid green;"
        # end
        # div class: "col-sm-2" do
        #     span class: "title-program" do "1" end

        #     span class: "title-description" do "1" end
        #     hr style: "margin: 20px 35px; border: 1px solid green;"
        # end
        # div class: "col-sm-2" do
        #     span class: "title-program" do "1" end

        #     span class: "title-description" do "1" end
        #     hr style: "margin: 20px 35px; border: 1px solid green;"
        # end
        end
    end 




  end # content
end
