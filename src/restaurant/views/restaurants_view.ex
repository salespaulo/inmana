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

  def render("all.json", %{result: page}) do
    IO.inspect(page)

    %{
      restaurants: %{
        data: page.entries,
        page_number: page.page_number,
        page_size: page.page_size,
        total_pages: page.total_pages,
        total_entries: page.total_entries
      }
    }
  end
end
