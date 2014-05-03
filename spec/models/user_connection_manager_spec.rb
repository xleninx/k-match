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

      let(:current1){ User.currents.first }
      let!(:prospective){ User.prospectives.second }
      let(:connection2){ UserConnectionManager.new(prospective, "message3").send_request }

      it{ connection2.should be_an_instance_of( Connection ) }
      it{ connection2.prospective_user.should == prospective }
      it{ connection2.current_user.should  == current1 }

      describe "user_with_lower_request_connections" do
        before do
          UserConnectionManager.new(User.prospectives.first,"message1").send_request
        end
        let!(:prospective2){ User.prospectives.second }
        let(:connection3){ UserConnectionManager.new(prospective2, "message3").send_request }
        let(:current2){ User.currents.last }
        it{ connection3.current_user.should == current2 }
      end

    end

  end

end