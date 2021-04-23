defmodule InmanaWeb.SupplyRestView do
  use InmanaWeb, :view

  def render("create.json", %{supply: supply}) do
    %{
      message: "Supply Created!",
      supply: supply
    }
  end

  def render("show.json", %{supply: supply}) do
    %{supply: supply}
  end

  def render("query.json", %{page: page}) do
    %{
      supplies: %{
        data: page.entries,
        page_number: page.page_number,
        page_size: page.page_size,
        total_pages: page.total_pages,
        total_entries: page.total_entries
      }
    }
  end
end
