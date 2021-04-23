defmodule Inmana do
  @moduledoc """
  Inmana keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Inmana.Restaurant
  alias Inmana.Supply

  # Restaurant
  defdelegate restaurant_create(params), to: Restaurant, as: :create
  defdelegate restaurant_get(uuid), to: Restaurant, as: :get
  defdelegate restaurant_get_all(), to: Restaurant, as: :get_all
  defdelegate restaurant_get_all(params), to: Restaurant, as: :get_all
  defdelegate restaurant_get_with_supplies(uuid), to: Restaurant, as: :get_with_supplies

  # Supply
  defdelegate supply_get(uuid), to: Supply, as: :get
  defdelegate supply_get_all(), to: Supply, as: :get_all
  defdelegate supply_get_all(params), to: Supply, as: :get_all
  defdelegate supply_get_by_expiration(), to: Supply, as: :get_by_expiration
  defdelegate supply_get_by_expiration(date), to: Supply, as: :get_by_expiration

  defdelegate supply_create(params), to: Supply, as: :create
  defdelegate supply_expiration_notify(), to: Supply, as: :expiration_notify
end
