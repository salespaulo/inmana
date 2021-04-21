defmodule Inmana.Restaurant do
  use Ecto.Schema
  alias Inmana.Supply
  import Ecto.Changeset
  import EctoCommons.EmailValidator

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :email]

  @derive {Jason.Encoder, only: [:id | @required_params]}

  schema "restaurants" do
    field :name, :string
    field :email, :string

    has_many :supplies, Supply

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3)
    |> validate_email(:email)
    |> unique_constraint([:email])
  end
end
