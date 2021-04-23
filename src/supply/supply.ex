defmodule Inmana.Supply do
  alias Inmana.Supply.Create, as: SupplyCreate
  alias Inmana.Supply.Get, as: SupplyGet
  alias Inmana.Supply.GetByExpiration, as: SupplyGetByExpiration
  alias Inmana.Supply.ExpirationNotification, as: SupplyExpirationNotification

  defdelegate get(uuid), to: SupplyGet, as: :call
  defdelegate get_by_expiration(), to: SupplyGetByExpiration, as: :call
  defdelegate get_by_expiration(date), to: SupplyGetByExpiration, as: :call

  defdelegate create(params), to: SupplyCreate, as: :call
  defdelegate expiration_notify(), to: SupplyExpirationNotification, as: :send
end