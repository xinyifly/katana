class Rule < ApplicationRecord
  enum key: { candidate_voter_limit: 'candidate_voter_limit',
              self_vote: 'self_vote' }, _prefix: true

  belongs_to :poll

  validates :key, uniqueness: { scope: :poll }

  def check(vote)
    send("check_#{key}", vote)
  end

  def check_self_vote(vote)
    # Values: '0' => disabled, '1' => enabled
    enabled = ActiveModel::Type::Boolean.new.cast(value)
    valid = enabled || vote.candidate.user != vote.voter
    vote.errors.add :candidate, "can't be yourself" unless valid
  end

  def check_candidate_voter_limit(vote)
    # Example value: '1,P1D' => limit: 1, period: 1 day
    # Ref: https://en.wikipedia.org/wiki/ISO_8601#Durations
    limit, period = value.split(',')
    limit = limit.to_i
    from = ActiveSupport::Duration.parse(period).ago
    votes = Vote.where(candidate: vote.candidate, voter: vote.voter)
    count = votes.where('created_at > ?', from).count
    vote.errors.add :candidate, 'reached your limit' if count >= limit
  end
end
