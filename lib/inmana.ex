defmodule Inmana do
  @moduledoc """
  Inmana keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Inmana.Restaurant.Create, as: RestaurantCreate
  alias Inmana.Supply.Create, as: SupplyCreate
  alias Inmana.Supply.Get, as: SupplyGet
  alias Inmana.Supply.GetByExpiration, as: SupplyGetByExpiration
  alias Inmana.Supply.ExpirationNotification, as: SupplyExpirationNotification

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate create_supplies(params), to: SupplyCreate, as: :call

  defdelegate get_supply(uuid), to: SupplyGet, as: :call
  defdelegate get_supplies_by_expiration(), to: SupplyGetByExpiration, as: :call
  defdelegate get_supplies_by_expiration(date), to: SupplyGetByExpiration, as: :call

  defdelegate expiration_notify(), to: SupplyExpirationNotification, as: :send
end
