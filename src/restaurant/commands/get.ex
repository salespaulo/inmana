defmodule Inmana.Restaurant.Get do
  alias Inmana.{Core, Restaurant}
  use Core.Command

  def call(uuid) do
    Restaurant.Schema
    |> get_by_id(uuid)
  end
end
