class Poll < ActiveRecord::Base
  has_many :options
  validates :question, presence: true, length: {maximum: 140}
  accepts_nested_attributes_for :options
end
