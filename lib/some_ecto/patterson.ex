defmodule SomeEcto.Patterson do
  use Ecto.Schema

  embedded_schema do
    field :first_name, :string
    field :last_name, :string
    field :age, :integer

    belongs_to :party, SomeEcto.Party
  end

  def changeset(patterson, params \\ %{}) do
    patterson
    |> Ecto.Changeset.cast(params, ~w(first_name last_name age party_id))
    |> Ecto.Changeset.validate_required([:first_name, :last_name])
    # |> Ecto.Changeset.cast_assoc(:party)
  end
end
