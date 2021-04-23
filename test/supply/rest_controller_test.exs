defmodule InmanaWeb.Supply.RestControllerTest do
  use InmanaWeb.ConnCase

  @path_url "/api/supplies"

  describe "create/2" do
    setup do
      {:ok, restaurant} = Inmana.restaurant_create(%{name: "Test", email: "test@test.com"})
      {:ok, restaurant_id: restaurant.id}
    end

    test "Success", %{conn: conn, restaurant_id: restaurant_id} do
      params = %{
        description: "Test",
        responsible: "Test",
        expiration_date: Date.utc_today(),
        restaurant_id: restaurant_id
      }

      result =
        conn
        |> post(@path_url, params)
        |> json_response(:created)

      assert %{
               "message" => "Supply Created!",
               "supply" => %{
                 "description" => "Test",
                 "responsible" => "Test"
               }
             } = result
    end

    test "Error", %{conn: conn} do
      params = %{description: "Te", responsible: "", expiration_date: nil}

      result =
        conn
        |> post(@path_url, params)
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "description" => ["should be at least 3 character(s)"]
               }
             } = result
    end
  end
end
