defmodule SomeEcto.Repo do
  use Ecto.Repo, otp_app: :some_ecto, adapter: Ecto.Adapters.Postgres
end
