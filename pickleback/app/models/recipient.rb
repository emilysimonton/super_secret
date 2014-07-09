class Recipient < ActiveRecord::Base
  belongs_to :poll, dependent: :destroy
end
