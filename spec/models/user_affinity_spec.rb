require 'spec_helper'
describe UserAffinity do

  describe "check_filters" do
    before do
      create_list(:country,2)
      create_list(:user,1,country: Country.last)
      create_list(:current,2,country: Country.last)
      create(:current,country: Country.first)
    end

    let(:user){ User.where(:country => Country.last).first }
    let(:user_without_affinity){ User.currents.where(:country => Country.first).first }
    let(:user_with_affinity){ User.currents.where(:country => Country.last).first }
    let(:affinity){ UserAffinity.new(user) }
    subject(:user_filter){affinity.users_with_affinities}

    describe "filter by country" do
      it{should_not == user_without_affinity}
      it{should == user_with_affinity}
    end
  end
end