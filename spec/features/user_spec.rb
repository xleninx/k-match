require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }
  before(:each){ User.destroy_all }
  before(:each) { register(user) }

  describe 'registration' do
    xit {expect(page).to have_content 'Welcome! You have signed up successfully.'}
    it {current_path.should == edit_user_path(User.last)}       
  end

  describe '#edit' do
    describe 'empty form' do
      before do 
        visit(edit_user_path(User.last))
        click_on "CONNECT ME TO A CURRENT STUDENT"
      end

      it{ current_path.should == user_path(User.last) }
    end
  end
end