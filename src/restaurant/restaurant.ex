defmodule Inmana.Restaurant do
  alias Inmana.Restaurant

  defdelegate create(params), to: Restaurant.Create, as: :call

  defdelegate get(uuid), to: Restaurant.Get, as: :call
  defdelegate get_with_supplies(uuid), to: Restaurant.GetWithSupplies, as: :call
end
