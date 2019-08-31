require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'can vote' do
    voter = create(:voter)
    candidate = create(:candidate)
    assert_difference('Vote.count', 1) do
      voter.vote(candidate)
    end
  end
end
