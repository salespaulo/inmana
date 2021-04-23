defmodule Inmana.Repo.Migrations.CreateTableSupplies do
  use Ecto.Migration

  def change do
    create table(:supply) do
      add :description, :string
      add :responsible, :string
      add :expiration_date, :date
      add :restaurant_id, references(:restaurant, type: :binary_id)

      timestamps()
    end

    create unique_index(:supply, [:description, :restaurant_id])
  end
end
