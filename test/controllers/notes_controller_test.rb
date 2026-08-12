require "test_helper"

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "index lists all notes" do
    get root_url
    assert_response :success
    assert_select "h1", "Notes"
    assert_select "a", "Welcome note"
  end

  test "show displays a note and its comments" do
    get note_url(notes(:welcome))
    assert_response :success
    assert_select "h1", "Welcome note"
    assert_select "h2", "Comments (2)"
  end

  test "new renders the create form" do
    get new_note_url
    assert_response :success
    assert_select "form" do
      assert_select "input[name='note[title]']"
      assert_select "textarea[name='note[body]']"
    end
  end

  test "create saves a valid note and redirects" do
    assert_difference -> { Note.count }, 1 do
      post notes_url, params: { note: { title: "Created", body: "A brand new note." } }
    end
    assert_redirected_to note_url(Note.last)
    assert_equal "Created", Note.last.title
  end

  test "create re-renders the form on invalid input" do
    assert_no_difference -> { Note.count } do
      post notes_url, params: { note: { title: "", body: "" } }
    end
    assert_response :unprocessable_entity
    assert_select ".alert-error"
  end

  test "edit renders the edit form" do
    get edit_note_url(notes(:welcome))
    assert_response :success
    assert_select "input[name='note[title]'][value='Welcome note']"
  end

  test "update changes the note and redirects" do
    patch note_url(notes(:welcome)), params: { note: { title: "Renamed", body: "Updated body." } }
    assert_redirected_to note_url(notes(:welcome))
    notes(:welcome).reload
    assert_equal "Renamed", notes(:welcome).title
  end

  test "update re-renders the form on invalid input" do
    patch note_url(notes(:welcome)), params: { note: { title: "", body: "" } }
    assert_response :unprocessable_entity
  end

  test "destroy deletes the note and its comments, then redirects" do
    note = notes(:welcome)
    assert_difference -> { Note.count }, -1 do
      assert_difference -> { Comment.count }, -note.comments.size do
        delete note_url(note)
      end
    end
    assert_redirected_to notes_url
  end
end
