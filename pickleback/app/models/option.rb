class Option < ActiveRecord::Base
  belongs_to :poll
  validates :answer, presence: true, length: {maximum: 50}
end

