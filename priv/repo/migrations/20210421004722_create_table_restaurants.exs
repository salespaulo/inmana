defmodule Inmana.Repo.Migrations.CreateTableRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurant) do
      add :name, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:restaurant, [:email])
  end
end
