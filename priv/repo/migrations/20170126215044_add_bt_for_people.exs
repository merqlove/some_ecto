defmodule SomeEcto.Repo.Migrations.AddBtForPeople do
  use Ecto.Migration

  def change do
    alter table(:people) do
      add :person_party_id, :integer
    end
  end
end
