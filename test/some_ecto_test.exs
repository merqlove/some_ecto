defmodule SomeEctoTest do
  use ExUnit.Case
  import Ecto
  import Ecto.Changeset
  import Ecto.Query
  alias SomeEcto.{Repo, Person, Patterson, Party}
  doctest SomeEcto

  @valid_attrs %{first_name: "some content", last_name: "some content", pattersons: [], person_party_id: nil}
  @patterson_valid_attrs %{first_name: "some content", last_name: "some content", party_id: nil}
  @party_valid_attrs %{name: "some content"}
  @party Repo.insert(Party.changeset(%Party{}, @party_valid_attrs)) |> elem(1)
  @invalid_attrs %{}

  test "preload for embed changeset with valid attributes" do
    patterson = Patterson.changeset(%Patterson{}, @patterson_valid_attrs) |> change(%{party_id: @party.id})
    changeset = Person.changeset(%Person{}, %{@valid_attrs | pattersons: [patterson]}) |> change(%{person_party_id: @party.id})
    assert changeset.valid?

    {:ok, person_loaded} = Repo.insert(changeset)

    new_person = Repo.get_by(Person, %{id: person_loaded.id})
    new_person = Repo.preload(new_person, :person_party) # OK
    assert new_person.person_party.name == @party.name
    pts = new_person.pattersons |> List.first
    pts = Repo.preload(pts, :party, prefix: nil) # OK
    assert pts.party.name == @party.name
    assert Repo.preload(pts, :party) # Fail
  end

  test "changeset with invalid attributes" do
    changeset = Person.changeset(%Person{}, @invalid_attrs)
    refute changeset.valid?
  end
end
