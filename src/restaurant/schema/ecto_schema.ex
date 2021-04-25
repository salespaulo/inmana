defmodule Inmana.Restaurant.Schema do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Supply

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:name, :email]

  @derive {Jason.Encoder, only: [:id | @required_params]}

  schema "restaurant" do
    field :name, :string
    field :email, :string

    has_many :supplies, Supply.Schema, foreign_key: :restaurant_id, references: :id

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
