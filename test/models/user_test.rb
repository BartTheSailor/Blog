require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should validate_inclusion_of(:role)\
  .in_array(['user', 'admin', 'editor'])

  # powyższe zastępuje:
 
  # test 'is valid with "admin" role' do
  #   user = build :user, role: 'admin'
  #   assert_predicate user, :valid?
  # end





  # test 'is valid with "editor" role' do
  #   user = build :user, role: 'editor'
  #   assert_predicate user, :valid?
  # end

  # test 'is valid with "foo" role' do
  #   user = build :user, role: 'foo'
  #   assert_predicate user, :invalid?
  # end



  test 'cannot be created when email exsists' do
    user = create :user, email: 'admin@codesensei.pl'
    user2 = build :user, email: 'admin@codesensei.pl'
    assert_predicate user2, :invalid?
  end
end
