# Offbook

OffBook is a software for stage management. This is not complete. Do not run this software.

(c) 2022 Alexander Lowry. Do not use.

## Installation

The server (a Phoenix server) requires Elixir 1.12 or later, Erlang 22 or later, and the hex package manager, as well as PostgreSQL. [Installation for these steps can be found here.](https://hexdocs.pm/phoenix/installation.html)

To start the OffBook server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check Phoenix's deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Phoneix stuff

  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix

