defmodule Inmana.Restaurant.GetWithSupplies do
  alias Inmana.{Core, Restaurant}
  use Core.Command

  def call(uuid) do
    case Ecto.UUID.cast(uuid) do
      {:ok, uuid} -> handle_success(uuid)
      :error -> handle_error_uuid_invalid()
    end
  end

  defp handle_success(uuid) do
    query =
      from restaurant in Restaurant.Schema,
        where: restaurant.id == ^uuid,
        preload: [:supplies]

    Repo.all(query)
    |> List.first()
    |> handle_response()
  end
end
