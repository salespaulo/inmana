defmodule Inmana.Supply.GetByExpiration do
  alias Inmana.{Core, Supply, Restaurant}
  use Core.Command

  def call() do
    call(Date.utc_today())
  end

  def call(nil) do
    call(Date.utc_today())
  end

  def call(date) do
    today = date
    begins_week = Date.beginning_of_week(today)
    ends_week = Date.end_of_week(today)

    query =
      from supply in Supply.Schema,
        where: supply.expiration_date >= ^begins_week and supply.expiration_date <= ^ends_week,
        preload: [:restaurant]

    query
    |> Repo.all()
    |> Enum.group_by(fn %Supply.Schema{restaurant: %Restaurant.Schema{email: email}} -> email end)
  end
end
