defmodule InmanaWeb.WelcomerController do
  use InmanaWeb, :controller
  alias Inmana.Welcomer

  def index(conn, params) do
    params
    |> Welcomer.welcome()
    |> handle_response(conn)
  end

  defp handle_response({:ok, message}, conn), do: handle_response(conn, :ok, message)

  defp handle_response({:error, message}, conn), do: handle_response(conn, :bad_request, message)

  defp handle_response(conn, status, message) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
end
