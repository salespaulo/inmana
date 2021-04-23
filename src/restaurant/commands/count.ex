defmodule Inmana.Restaurant.Count do
  alias Inmana.{Core, Restaurant}
  use Core.Command

  def call() do
    from(Restaurant.Schema)
    |> Repo.aggregate(:count)
  end
end
