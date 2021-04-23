defmodule Inmana.Restaurant do
  alias Inmana.Restaurant.{Create, Get, GetAll, GetWithSupplies}

  defdelegate create(params), to: Create, as: :call

  defdelegate get(uuid), to: Get, as: :call
  defdelegate get_with_supplies(uuid), to: GetWithSupplies, as: :call

  defdelegate get_all(), to: GetAll, as: :call
  defdelegate get_all(params), to: GetAll, as: :call
end
