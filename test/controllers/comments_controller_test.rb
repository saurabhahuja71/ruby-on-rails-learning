require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "create adds a comment to the note and redirects back" do
    note = notes(:mvc)
    assert_difference -> { note.comments.count }, 1 do
      post note_comments_url(note), params: { comment: { body: "Thanks for the explanation." } }
    end
    assert_redirected_to note_url(note)
  end

  test "create re-renders the note on invalid comment" do
    note = notes(:mvc)
    assert_no_difference -> { Comment.count } do
      post note_comments_url(note), params: { comment: { body: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "destroy removes the comment and redirects back" do
    comment = comments(:one)
    note = comment.note
    assert_difference -> { Comment.count }, -1 do
      delete note_comment_url(note, comment)
    end
    assert_redirected_to note_url(note)
  end
end
