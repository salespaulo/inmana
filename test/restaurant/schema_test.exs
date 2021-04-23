defmodule Inmana.Restaurant.SchemaTest do
  alias Ecto.Changeset
  alias Inmana.{DataCase, Restaurant}
  use DataCase

  describe "changeset/1" do
    test "Success" do
      params = %{name: "Test", email: "test@test.com"}
      result = Restaurant.Schema.changeset(params)

      assert %Changeset{
               changes: ^params,
               valid?: true
             } = result
    end

    test "Error" do
      params = %{name: "Te", email: ""}
      result = Restaurant.Schema.changeset(params)

      assert %{
               name: ["should be at least 3 character(s)"],
               email: ["can't be blank"]
             } = errors_on(result)
    end
  end
end
