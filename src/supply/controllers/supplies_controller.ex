defmodule InmanaWeb.Supply.RestController do
  use InmanaWeb, :controller
  alias Inmana.Supply
  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply.Schema{} = supply} <- Inmana.supply_create(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply.Schema{} = supply} <- Inmana.supply_get(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end
end
