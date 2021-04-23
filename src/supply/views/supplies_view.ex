defmodule InmanaWeb.Supply.RestView do
  use InmanaWeb, :view

  def render("create.json", %{supply: supply}) do
    %{
      message: "Supply created!",
      supply: supply
    }
  end

  def render("show.json", %{supply: supply}) do
    %{supply: supply}
  end

  def render("all.json", %{data: data, pageable: pageable}) do
    %{supplies: %{data: data, pageable: pageable}}
  end
end
