defmodule InmanaWeb.RestaurantRestViewTest do
  alias InmanaWeb.{ConnCase, RestaurantRestView}
  alias Inmana.Restaurant

  use ConnCase

  describe "render/2" do
    import Phoenix.View

    test "create.json" do
      {:ok, restaurant} = Inmana.restaurant_create(%{name: "Test", email: "test@test.com"})
      result = render(RestView, "create.json", %{restaurant: restaurant})

      assert %{
               message: "Restaurant Created!",
               restaurant: %Restaurant.Schema{
                 id: _id,
                 name: "Test",
                 email: "test@test.com"
               }
             } = result
    end

    test "show.json" do
      {:ok, restaurant} = Inmana.restaurant_create(%{name: "Test", email: "test@test.com"})
      result = render(RestView, "show.json", %{restaurant: restaurant})

      assert %{
               restaurant: %Inmana.Restaurant.Schema{
                 id: _id,
                 supplies: _supplies,
                 name: "Test",
                 email: "test@test.com"
               }
             } = result
    end

    test "query.json" do
      {:ok, page} = Inmana.restaurant_get_all()
      result = render(RestView, "query.json", %{page: page})
      assert %{} = result

      assert %{
               restaurants: %{
                 data: [
                   %Inmana.Restaurant.Schema{
                     email: "test01@test.com",
                     name: "Test 01"
                   },
                   %Inmana.Restaurant.Schema{
                     email: "test02@test.com",
                     name: "Test 02"
                   }
                 ],
                 page_number: 1,
                 page_size: 10,
                 total_entries: 2,
                 total_pages: 1
               }
             } = result
    end
  end
end
