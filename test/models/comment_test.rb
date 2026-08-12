require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "body is required" do
    comment = Comment.new(body: "")
    assert_not comment.valid?
    assert_includes comment.errors[:body], "can't be blank"
  end

  test "comment belongs to a note" do
    comment = comments(:one)
    assert_equal notes(:welcome), comment.note
  end
end
