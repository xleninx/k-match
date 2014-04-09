class AfterFunction < ActiveRecord::Base
  belongs_to :function
  belongs_to :user
end
