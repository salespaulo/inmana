defmodule InmanaWeb.Restaurant.RestView do
  use InmanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant Created!",
      restaurant: restaurant
    }
  end

  def render("show.json", %{restaurant: restaurant}) do
    %{restaurant: restaurant}
  end

  def render("all.json", %{data: data, pageable: pageable}) do
    %{restaurants: %{data: data, pageable: pageable}}
  end
end
