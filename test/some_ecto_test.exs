defmodule SomeEctoTest do
  use ExUnit.Case
  import Ecto
  import Ecto.Changeset
  import Ecto.Query
  alias SomeEcto.{Repo, Person, Patterson, Party}
  doctest SomeEcto

  alias HelloPhoenix.User

  @valid_attrs %{first_name: "some content", last_name: "some content", pattersons: []}
  @patterson_valid_attrs %{first_name: "some content", last_name: "some content", party_id: nil}
  @party_valid_attrs %{name: "some content"}
  @party Repo.insert(Party.changeset(%Party{}, @party_valid_attrs)) |> elem(1)
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    patterson = Patterson.changeset(%Patterson{}, @patterson_valid_attrs)
    patterson = patterson |> change(%{party_id: @party.id})
    changeset = Person.changeset(%Person{}, %{@valid_attrs | pattersons: [patterson]})
    assert changeset.valid?

    {:ok, person_loaded} = Repo.insert(changeset)

    new_person = Repo.get_by(Person, %{id: person_loaded.id})
    pts = new_person.pattersons |> List.first
    assert Repo.preload(pts, :party)
  end

  test "changeset with invalid attributes" do
    changeset = Person.changeset(%Person{}, @invalid_attrs)
    refute changeset.valid?
  end
end