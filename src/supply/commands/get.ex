defmodule Inmana.Supply.Get do
  alias Inmana.{Core, Supply}
  use Core.Command

  def call(uuid) do
    Supply.Schema
    |> get_by_id(uuid)
  end
end
