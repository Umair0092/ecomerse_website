# Rails 8 Storefront

A practice e-commerce app built with **Rails 8**, used to explore the framework's newer defaults and core ActiveRecord patterns.

## Features

- **Authentication** with the Rails 8 generator: `has_secure_password`, database-backed sessions and password reset by email
- **Products** with image uploads through Active Storage
- **Reviews** nested under products using shallow routes
- **Carts and orders** scoped to each user

## ActiveRecord patterns explored

- `delegated_type` for posts that can be an article or a video
- Single-table inheritance with a custom `inheritance_column`
- Model concerns (`Postable`)
- `normalizes` for cleaning email input
- `Current` attributes for request-scoped session and user
- Model callbacks (`after_initialize`, `after_find`) and custom validators

## Tech stack

| Layer | Tools |
|---|---|
| Framework | Ruby 3.4, Rails 8.0 |
| Database | MySQL |
| Frontend | Hotwire (Turbo + Stimulus), Bootstrap, Dart Sass, Importmap |
| Background jobs, cache and cable | Solid Queue, Solid Cache, Solid Cable |
| Quality | Minitest, Capybara, RuboCop (omakase), Brakeman |
| Deploy | Kamal, Thruster |

## Getting started

Requirements: Ruby 3.4.4 and MySQL running locally.

```bash
git clone https://github.com/Umair0092/ecomerse_website.git
cd ecomerse_website
bin/setup        # installs gems, prepares the database
bin/dev          # starts the server and the Sass watcher
```

Then open http://localhost:3000.

## Running tests

```bash
bin/rails test
bin/rails test:system
```
