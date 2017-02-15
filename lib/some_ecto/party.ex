defmodule SomeEcto.Party do
  use Ecto.Schema

  schema "party" do
    field :name, :string
  end

  def changeset(party, params \\ %{}) do
    party
    |> Ecto.Changeset.cast(params, ~w(name))
  end
end
