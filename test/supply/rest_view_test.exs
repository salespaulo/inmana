defmodule InmanaWeb.Supply.RestViewTest do
  alias Inmana.Supply
  alias InmanaWeb.{ConnCase, Supply.RestView}

  use ConnCase

  describe "render/2" do
    import Phoenix.View

    setup do
      {:ok, restaurant} = Inmana.restaurant_create(%{name: "Test", email: "test@test.com"})

      {:ok, restaurant_id: restaurant.id}
    end

    test "create.json", %{restaurant_id: restaurant_id} do
      today = Date.utc_today()

      {:ok, supply} =
        Inmana.supply_create(%{
          description: "Test",
          responsible: "Test",
          expiration_date: today,
          restaurant_id: restaurant_id
        })

      result = render(RestView, "create.json", %{supply: supply})

      assert %{
               message: "Supply Created!",
               supply: %Supply.Schema{
                 description: "Test",
                 responsible: "Test",
                 expiration_date: ^today,
                 restaurant_id: ^restaurant_id
               }
             } = result
    end

    test "show.json", %{restaurant_id: restaurant_id} do
      today = Date.utc_today()

      {:ok, supply} =
        Inmana.supply_create(%{
          description: "Test",
          responsible: "Test",
          expiration_date: today,
          restaurant_id: restaurant_id
        })

      result = render(RestView, "show.json", %{supply: supply})

      assert %{
               supply: %Inmana.Supply.Schema{
                 description: "Test",
                 responsible: "Test",
                 expiration_date: ^today,
                 restaurant_id: ^restaurant_id
               }
             } = result
    end

    test "query.json" do
      {:ok, page} = Inmana.supply_get_all()
      result = render(RestView, "query.json", %{page: page})
      assert %{} = result

      assert %{
               supplies: %{
                 data: [
                   %Inmana.Supply.Schema{
                     description: "Test 02",
                     expiration_date: ~D[2021-04-27],
                     responsible: "test01@test.com",
                     restaurant_id: "71ffea47-fe9f-4b77-89ee-753e45cb7127"
                   },
                   %Inmana.Supply.Schema{
                     description: "Produto 01",
                     expiration_date: ~D[2021-04-23],
                     responsible: "paulo.03",
                     restaurant_id: "71ffea47-fe9f-4b77-89ee-753e45cb7127"
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
