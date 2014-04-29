require 'spec_helper'
describe '#sign_in' do
  describe "#admin_user" do
    let(:admin){create(:user,user_rights: 3)}
    before { login(admin.email,'12345678') }

    it{  current_path.should == admin_root_path }
  end
  describe "#other_user" do
    let(:user){create(:user)}
    before{login(user.email,'12345678')}

    it{ current_path.should == edit_user_path(user) }
  end
end