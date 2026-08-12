# == Model (the "M" in MVC) ==
class Comment < ApplicationRecord
  # Association: each comment belongs to exactly one note.
  # Rails adds: comment.note, comment.note_id
  belongs_to :note

  validates :body, presence: true, length: { minimum: 2 }
end
