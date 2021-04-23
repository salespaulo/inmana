defmodule InmanaWeb.Restaurant.RestController do
  use InmanaWeb, :controller
  alias Inmana.Restaurant
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant.Schema{} = restaurant} <- Inmana.restaurant_create(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Restaurant.Schema{} = restaurant} <- Inmana.restaurant_get(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", restaurant: restaurant)
    end
  end
end
