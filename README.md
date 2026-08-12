# Rails MVC Learning Project

A complete, working **Notes + Comments** app built with Ruby on Rails 8 — designed as a teaching example of the **MVC (Model-View-Controller)** architecture.

Every layer is heavily commented so you can read the code top-to-bottom and learn by example.

## What it demonstrates

| Layer | File(s) | What you'll learn |
| --- | --- | --- |
| **Router** | `config/routes.rb` | HTTP request → controller action mapping, nested RESTful resources |
| **Model** | `app/models/note.rb`, `app/models/comment.rb` | Active Record: associations (`has_many` / `belongs_to`), validations, CRUD |
| **Controller** | `app/controllers/notes_controller.rb`, `comments_controller.rb` | Actions, strong parameters, redirect vs render, flash messages |
| **View** | `app/views/notes/`, `app/views/comments/` | ERB templates, shared partials (`_form`), helper methods |

Plus: database migrations, seeds, fixtures, model & controller tests.

## Tech Stack

- **Ruby 3.3** with **Rails 8.1**
- **SQLite 3** — zero-config database for development
- **Puma** web server
- **Propshaft** asset pipeline
- **Importmap** — no Node.js build step
- **Hotwire (Turbo + Stimulus)** for interactivity

## Getting Started

### Prerequisites

| Tool | Version |
| --- | --- |
| [Ruby](https://www.ruby-lang.org/en/documentation/installation/) | 3.3.x |
| Bundler | comes with Ruby |
| SQLite | 3.x (usually preinstalled) |

> No Node.js, Yarn, or build tools required — asset handling is pure Ruby.

### 1. Install the project

```bash
bundle install
```

### 2. Set up the database (with sample data)

```bash
bin/rails db:create db:migrate db:seed
```

### 3. Run the server

```bash
bin/rails server
```

Open <http://localhost:3000> — you'll see the seeded notes. Create, edit, delete notes and add/delete comments to exercise every MVC layer.

### 4. Run the tests

```bash
bin/rails test
```

### Useful commands while learning

```bash
bin/rails routes                # show all routes (Router cheat-sheet)
bin/rails console               # interactive Ruby shell with models loaded
bin/rails generate model <Name> # generate a model + migration
bin/rails db:migrate            # apply pending migrations
bin/rails db:seed               # (re)load sample data
```

## How a request flows through MVC

1. **Router** matches `GET /notes/1` → `NotesController#show`
2. **Controller** loads the record: `@note = Note.find(params[:id])`
3. **Model** reads the row from the database via Active Record
4. **Controller** renders `app/views/notes/show.html.erb`
5. **View** outputs HTML with the data, sent back to the browser

## Structure

```
app/
├── controllers/          # handle requests and render views
│   ├── notes_controller.rb     # full CRUD for notes
│   └── comments_controller.rb  # nested create/destroy
├── models/               # Active Record: tables become classes
│   ├── note.rb           # has_many :comments, validations
│   └── comment.rb        # belongs_to :note, validations
├── views/
│   ├── notes/            # index, show, new, edit + _form partial
│   ├── comments/         # _form, _comment partials
│   └── layouts/application.html.erb
└── assets/stylesheets/   # plain CSS design system
config/routes.rb          # URL -> controller/action mapping
db/migrate/               # versioned schema migrations
db/seeds.rb               # sample data
test/                     # model & controller tests + fixtures
```

## Roadmap Ideas

- [ ] User authentication
- [ ] Tags / categories on notes
- [ ] Full-text search
- [ ] Pagination
- [ ] System tests with Capybara

## License

This project is open source and available under the [MIT License](LICENSE).
