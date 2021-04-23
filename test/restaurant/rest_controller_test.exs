defmodule InmanaWeb.RestaurantRestControllerTest do
  use InmanaWeb.ConnCase

  @path_url "/api/restaurants"

  describe "create/2" do
    test "Success", %{conn: conn} do
      params = %{name: "Test", email: "test@test.com"}

      result =
        conn
        |> post(@path_url, params)
        |> json_response(:created)

      assert %{
               "message" => "Restaurant Created!",
               "restaurant" => %{
                 "id" => _id,
                 "name" => "Test",
                 "email" => "test@test.com"
               }
             } = result
    end

    test "Error", %{conn: conn} do
      params = %{name: "Te", email: ""}

      result =
        conn
        |> post(@path_url, params)
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "email" => ["can't be blank"],
                 "name" => ["should be at least 3 character(s)"]
               }
             } = result
    end
  end
end
