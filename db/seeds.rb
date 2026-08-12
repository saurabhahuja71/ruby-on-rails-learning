# Seed the development database with sample data.
# Run with: bin/rails db:seed
# This demonstrates the Model layer: create! raises if a record is invalid.

note = Note.create!(
  title: "Welcome to your Rails learning app",
  body: "This is a Note. Every note can have Comments. Try editing this one or creating a new note. This project shows the full MVC pattern: Model (Active Record), View (ERB templates), and Controller (actions that tie them together)."
)

note.comments.create!(body: "Great start!")
note.comments.create!(body: "Delete this comment to see the nested destroy action work.")

Note.create!(
  title: "How MVC works",
  body: "A request comes in through the Router, hits a Controller action, which reads/writes the Model, and finally renders a View. Controllers never write HTML and Models never handle HTTP."
)
