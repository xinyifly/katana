require 'test_helper'

class RuleTest < ActiveSupport::TestCase
  test 'check self vote' do
    poll = create(:poll)

    key = Rule.keys[:self_vote]
    value = '0' # disabled
    rule = create(:rule, poll: poll, key: key, value: value)

    candidate = create(:candidate, poll: poll)

    # Disabled self vote
    vote = build(:vote, candidate: candidate, voter: candidate.user)
    rule.check_self_vote(vote)
    assert_not_empty vote.errors

    # Enabled self vote
    rule.value = '1'
    rule.save!
    vote = build(:vote, candidate: candidate, voter: candidate.user)
    rule.check_self_vote(vote)
    assert_empty vote.errors
  end

  test 'check candidate voter limit' do
    poll = create(:poll)

    key = Rule.keys[:candidate_voter_limit]
    value = '1,P1D' # limit: 1, period: 1 day
    rule = create(:rule, poll: poll, key: key, value: value)

    candidate = create(:candidate, poll: poll)
    voter = create(:voter)

    # 0 vote
    vote = build(:vote, candidate: candidate, voter: voter)
    rule.check_candidate_voter_limit(vote)
    assert_empty vote.errors

    # 1 vote before period
    create(:vote, candidate: candidate, voter: voter, created_at: 2.days.ago)
    vote = build(:vote, candidate: candidate, voter: voter)
    rule.check_candidate_voter_limit(vote)
    assert_empty vote.errors

    # 1 vote in period
    create(:vote, candidate: candidate, voter: voter)
    vote = build(:vote, candidate: candidate, voter: voter)
    rule.check_candidate_voter_limit(vote)
    assert_not_empty vote.errors
  end
end
