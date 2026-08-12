# == Controller (the "C" in MVC) ==
# Handles comments, which are nested inside a note.
class CommentsController < ApplicationController
  before_action :set_note

  # POST /notes/:note_id/comments
  def create
    @comment = @note.comments.build(comment_params)

    if @comment.save
      redirect_to @note, notice: "Comment added."
    else
      # Reuse the note's show page so error messages render next to the form.
      @comments = @note.comments
      render "notes/show", status: :unprocessable_entity
    end
  end

  # DELETE /notes/:note_id/comments/:id
  def destroy
    @comment = @note.comments.find(params[:id])
    @comment.destroy
    redirect_to @note, notice: "Comment deleted.", status: :see_other
  end

  private

  def set_note
    @note = Note.find(params[:note_id])
  end

  def comment_params
    params.expect(comment: [ :body ])
  end
end
