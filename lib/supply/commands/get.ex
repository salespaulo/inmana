defmodule Inmana.Supply.Get do
  alias Inmana.{Repo, Supply}

  def call(uuid) do
    case Ecto.UUID.cast(uuid) do
      {:ok, uuid} -> handle_success(uuid)
      :error -> handle_error("UUID is invalid!", :bad_request)
    end
  end

  defp handle_success(uuid) do
    Repo.get(Supply.Schema, uuid)
    |> handle_response()
  end

  defp handle_error(msg, status) when is_atom(status) do
    {:error, %{result: msg, status: status}}
  end

  defp handle_response(%Supply.Schema{} = supply) do
    {:ok, supply}
  end

  defp handle_response(nil) do
    handle_error("Supply not found!", :not_found)
  end
end
