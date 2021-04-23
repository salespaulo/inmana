defmodule Inmana.Supply.Create do
  alias Inmana.{Core, Supply}
  use Core.Command

  def call(params) do
    params
    |> Supply.Schema.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Supply.Schema{} = result}), do: handle_response(result)
  defp handle_insert({:error, result}), do: handle_error(result, :bad_request)
end
