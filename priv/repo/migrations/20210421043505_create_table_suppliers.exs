defmodule Inmana.Repo.Migrations.CreateTableSuppliers do
  use Ecto.Migration

  def change do
    create table :suppliers do
      # add :restaurant_id, :foreign_key
      add :description, :string
      add :responsable, :string
      add :expiration_date, :datetime

      timestamps()
    end

    # create unique_index(:suppliers, [:id, :restaurant_id])
  end
end
