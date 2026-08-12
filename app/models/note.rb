# == Model (the "M" in MVC) ==
# Models wrap database rows. Rails fills them with "magic" methods for free:
#  * Note.new / Note.create / note.save / note.destroy  (CRUD)
#  * note.comments, note.comments.build(...)            (associations)
#  * note.valid? / note.errors                          (validations)
class Note < ApplicationRecord
  # Association: each note can have many comments.
  # dependent: :destroy  -> when a note is deleted, its comments are deleted too.
  has_many :comments, dependent: :destroy

  # Validations run automatically on save/create/update.
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { minimum: 5 }
end
