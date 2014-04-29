require 'spec_helper'
describe UserAffinity do

  describe "check_filters" do
    before do
      create_list(:country,2)
      create_list(:user,3,country: Country.last)
      create(:user,country: Country.first)
    end
    let(:user){ User.where(:country => Country.last).first }
    let(:user_without_affinity){ User.where(:country => Country.first).first }
    let(:affinity){ UserAffinity.new(user) }
    subject(:user_with_affinity){affinity.users_with_affinities}

    describe "filter by country" do
      it{should have(2).user}
      it{should_not include(user)}
      it{should_not include(user_without_affinity)}
    end
  end
end