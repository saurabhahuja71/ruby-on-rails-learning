require "test_helper"

class NoteTest < ActiveSupport::TestCase
  test "title is required" do
    note = Note.new(title: "", body: "Some body text")
    assert_not note.valid?
    assert_includes note.errors[:title], "can't be blank"
  end

  test "body is required" do
    note = Note.new(title: "Hello", body: "")
    assert_not note.valid?
    assert_includes note.errors[:body], "can't be blank"
  end

  test "title cannot exceed 100 characters" do
    note = Note.new(title: "x" * 101, body: "Valid body")
    assert_not note.valid?
    assert_includes note.errors[:title], "is too long (maximum is 100 characters)"
  end

  test "valid note passes validations" do
    note = Note.new(title: "Hello", body: "A valid body.")
    assert note.valid?
  end

  test "a note has many comments" do
    note = notes(:welcome)
    assert_equal 2, note.comments.size
  end

  test "destroying a note destroys its comments" do
    note = notes(:welcome)
    assert_difference -> { Comment.count }, -note.comments.size do
      note.destroy
    end
  end
end
