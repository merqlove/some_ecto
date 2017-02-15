defmodule SomeEcto.Person do
  use Ecto.Schema

  schema "people" do
    field :first_name, :string
    field :last_name, :string
    field :age, :integer

    embeds_many :pattersons, SomeEcto.Patterson, on_replace: :delete
  end

  def changeset(person, params \\ %{}) do
    person
    |> Ecto.Changeset.cast(params, ~w(first_name last_name age))
    |> Ecto.Changeset.validate_required([:first_name, :last_name])
    |> Ecto.Changeset.put_embed(:pattersons, params[:pattersons])
  end
end
