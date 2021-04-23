defmodule Inmana.Restaurant.Create do
  alias Inmana.{Repo, Restaurant}

  def call(params) do
    params
    |> Restaurant.Schema.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Restaurant.Schema{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
