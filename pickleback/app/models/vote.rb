class Vote < ActiveRecord::Base
  belongs_to :voter
  belongs_to :poll
end
