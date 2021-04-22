defmodule Inmana.Supply.Schema do
  use Ecto.Schema
  alias Inmana.Restaurant
  import Ecto.Changeset
  import EctoCommons.DateValidator

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :expiration_date, :responsible, :restaurant_id]

  @derive {Jason.Encoder, only: [:id | @required_params]}

  schema "supplies" do
    field :description, :string
    field :responsible, :string
    field :expiration_date, :date

    belongs_to :restaurant, Restaurant.Schema

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_length(:description, min: 3)
    |> validate_length(:responsible, min: 3)
    |> validate_date(:expiration_date)
    |> unique_constraint([:description, :restaurant_id])
  end
end
