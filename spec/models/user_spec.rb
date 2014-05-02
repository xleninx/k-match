require 'spec_helper'
describe User do
  its(:admin?){should respond_to}

  describe "methods" do
    describe "#admin?" do
      describe "user_rights = 3" do
        let(:user){build(:user,user_rights: 3)}
        it{user.admin?.should be_true}
      end
      (0..2).each do |right|
        describe "user_rights = #{right}" do
          let(:user){build(:user,user_rights: right)}
          it{user.admin?.should be_false}
        end
      end
    end

    describe "#rigths_string" do
      let(:user){build(:user,user_rights: 3)}
      it{user.rigths_string.should == "Admin Student"}
    end
  end
end