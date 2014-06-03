require 'spec_helper'
describe UserAffinity do

  describe "check_connections" do
    before do
      create_list(:prospective,4)
      create_list(:admin,1)
      create_list(:leader,2)
    end
    let!(:prospective){ User.prospectives.first }
    let!(:prospective2){ User.prospectives.second }
    let!(:leader1){ User.leaders.first }
    let!(:leader2){ User.leaders.last }
    describe "without_current" do
      let(:connection){ UserConnectionManager.new(prospective,"message1").send_request }
    
      it{ connection.should be_an_instance_of( Connection ) }
      it{ connection.prospective_user.should == prospective }
      it{ connection.current_user.should  == leader1 }

      describe "user_with_lower_request_connections" do
        before do
          UserConnectionManager.new(User.prospectives.first,"message1").send_request
        end
        let(:connection2){ UserConnectionManager.new(prospective2,"message2").send_request }
        it{ connection2.current_user.should == leader2 }

      end
    end

    describe "with_current" do
      before do
        create_list(:current,2)
      end
      let(:currents){ User.currents }
      let(:current1){ User.currents.first }
      let!(:prospective){ User.prospectives.second }
      let(:connection2){ UserConnectionManager.new(prospective, "message3").send_request }

      it{ currents.should have(2).currents }
      it{ connection2.should be_an_instance_of( Connection ) }
      it{ connection2.prospective_user.should == prospective }
      it{ connection2.current_user.should  == current1 }

      describe "user_with_lower_request_connections" do
        before do
          UserConnectionManager.new(User.prospectives.first,"message1").send_request
        end
        let!(:prospective2){ User.prospectives.second }
        let(:current2){ User.currents.last }
        let(:connection3){ UserConnectionManager.new(prospective2, "message3").send_request }

        it{ connection3.current_user.should == current2 }
      end

      describe "2 rejected assig to lider role" do
        before do
          @manager_connection = UserConnectionManager.new(prospective, "message")
          connection1 = @manager_connection.send_request
          connection1.update_attributes(created_at: 3.days.ago)
          connection2 = @manager_connection.send_request
          connection2.update_attributes(created_at: 3.days.ago)
          connection3 = @manager_connection.send_request

        end

        let(:connection1){ Connection.order("id DESC").offset(2).limit(1).first }
        let(:connection2){ Connection.order("id DESC").offset(1).limit(1).first }
        let(:connection3){ Connection.order("id DESC").limit(1).first }

        it{connection1.status.should == 'rejected'}
        it{connection2.status.should == 'rejected'}
        it{connection3.status.should == 'pending'}
        it{connection1.current_user.current?.should be_true}
        it{connection2.current_user.current?.should be_true}
        it{connection3.current_user.leader?.should be_true}

        describe "remake connection with established" do
          before do
            @manager_connection.connection_accept
            @manager_connection.send_request
          end

          it{prospective.should have(1).request_pending_propective}
        end
      end

    end

  end

end