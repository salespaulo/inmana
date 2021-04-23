defmodule Inmana.Supply.SchemaTest do
  alias Ecto.Changeset
  alias Inmana.{DataCase, Supply}
  use DataCase

  describe "changeset/1" do
    test "Success" do
      today = Date.utc_today()

      params = %{
        description: "Test",
        responsible: "test@test.com",
        expiration_date: today,
        restaurant_id: "afc7176a-c24f-4478-a023-d512f562d07d"
      }

      result = Supply.Schema.changeset(params)

      assert %Changeset{
               changes: ^params,
               valid?: true
             } = result
    end

    test "Error" do
      params = %{description: "Te", responsible: ""}
      result = Supply.Schema.changeset(params)

      assert %{
               description: ["should be at least 3 character(s)"]
             } = errors_on(result)
    end
  end
end
