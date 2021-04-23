# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Inmana.Repo.insert!(%Inmana.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Inmana.{Repo, Restaurant, Supply}

restaurant1 =
  %{"name" => "Test 01", "email" => "test01@test.com"}
  |> Restaurant.Schema.changeset()
  |> Repo.insert!()

%{"name" => "Test 02", "email" => "test02@test.com"}
|> Restaurant.Schema.changeset()
|> Repo.insert!()
|> IO.inspect()

%{
  description: "Test 02",
  responsible: restaurant1.email,
  expiration_date: "2021-04-27",
  restaurant_id: restaurant1.id
}
|> Supply.Schema.changeset()
|> Repo.insert!()
|> IO.inspect()
