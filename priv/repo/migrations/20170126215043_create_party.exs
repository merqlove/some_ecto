defmodule SomeEcto.Repo.Migrations.CreateParty do
  use Ecto.Migration

  def change do
    create table(:party) do
      add :name, :string
    end
  end
end
