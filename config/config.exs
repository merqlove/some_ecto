# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :some_ecto, SomeEcto.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  username: "dev",
  pool_size: 10,
  database: "some_ecto_repo"

config :some_ecto, ecto_repos: [SomeEcto.Repo]

import_config "#{Mix.env}.exs"
