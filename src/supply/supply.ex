defmodule Inmana.Supply do
  alias Inmana.Supply.{Create, Get, GetAll, GetByExpiration, ExpirationNotification}

  defdelegate get(uuid), to: Get, as: :call
  defdelegate get_by_expiration(), to: GetByExpiration, as: :call
  defdelegate get_by_expiration(date), to: GetByExpiration, as: :call

  defdelegate get_all(), to: GetAll, as: :call
  defdelegate get_all(params), to: GetAll, as: :call

  defdelegate create(params), to: Create, as: :call
  defdelegate expiration_notify(), to: ExpirationNotification, as: :send
end
