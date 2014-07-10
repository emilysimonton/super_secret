class Poll < ActiveRecord::Base
  has_many :options
  belongs_to :user
  has_many :votes
  has_many :voters, through: :votes
  validates :question, presence: true, length: {maximum: 140}
  accepts_nested_attributes_for :options
  before_create :generate_token

  private
  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Poll.exists?(token: random_token)
    end
  end
end
