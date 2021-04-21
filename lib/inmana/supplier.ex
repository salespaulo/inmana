defmodule Supplier do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @fields [:id, :description, :responsable]
  @derive {Jason.Encoder, only: @fields}

  schema "suppliers" do
    field :description, :string
    field :responsable, :string
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
  end
end
