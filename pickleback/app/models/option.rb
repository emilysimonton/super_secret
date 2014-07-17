class Option < ActiveRecord::Base
  belongs_to :poll
  validates :answer, presence: true, length: {maximum: 50}

  def vote_proportion_string
    "#{self.votes} / #{self.poll.total_votes}"
  end

  def vote_percent
    poll.total_votes == 0 ? 0 : (self.votes.to_f/self.poll.total_votes.to_f)*100
  end

end

