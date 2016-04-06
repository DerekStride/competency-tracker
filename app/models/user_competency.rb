class UserCompetency < ActiveRecord::Base
  belongs_to :user
  belongs_to :competency
  belongs_to :assessor, class_name: 'User', inverse_of: :assessed
end
