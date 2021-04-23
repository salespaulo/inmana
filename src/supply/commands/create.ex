defmodule Inmana.Supply.Create do
  alias Inmana.{Repo, Supply}

  def call(params) do
    params
    |> Supply.Schema.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Supply.Schema{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
