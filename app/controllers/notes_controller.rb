# == Controller (the "C" in MVC) ==
# Controllers receive HTTP requests, use the Model, and hand data to the View.
#
# Naming convention: an action renders app/views/notes/<action>.html.erb
# automatically (except actions that redirect).
class NotesController < ApplicationController
  # GET /notes                    -> list all notes
  def index
    @notes = Note.all.order(created_at: :desc)
  end

  # GET /notes/:id                -> show one note
  def show
    @note = Note.find(params[:id])
    @comment = @note.comments.build  # empty comment for the form
  end

  # GET /notes/new                -> show the create form
  def new
    @note = Note.new
  end

  # POST /notes                   -> try to save the new note
  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note, notice: "Note created."
    else
      # Keep the user's input and re-render the form with error messages.
      render :new, status: :unprocessable_entity
    end
  end

  # GET /notes/:id/edit           -> show the edit form
  def edit
    @note = Note.find(params[:id])
  end

  # PATCH/PUT /notes/:id          -> try to update the note
  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to @note, notice: "Note updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /notes/:id             -> remove the note (and its comments)
  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path, notice: "Note deleted.", status: :see_other
  end

  private

  # Strong parameters: only allow fields we trust from the form.
  # Prevents mass-assignment attacks.
  def note_params
    params.expect(note: [ :title, :body ])
  end
end
