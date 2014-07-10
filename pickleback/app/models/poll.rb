class Poll < ActiveRecord::Base
  has_many :options
  has_many :recipients
  belongs_to :user
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
