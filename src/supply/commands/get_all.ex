defmodule Inmana.Supply.GetAll do
  alias Inmana.{Core, Supply}
  use Core.Command

  @page_init 1
  @page_size 10

  def call(%{"description" => description, "page" => page, "page_size" => page_size}) do
    {page, _} = Integer.parse(page)
    {page_size, _} = Integer.parse(page_size)
    paginate(description, page, page_size)
  end

  def call(%{"description" => description, "page" => page}) do
    {page, _} = Integer.parse(page)
    paginate(description, page, @page_size)
  end

  def call(%{"description" => description, "page_size" => page_size}) do
    {page_size, _} = Integer.parse(page_size)
    paginate(description, @page_init, page_size)
  end

  def call(%{"description" => description}) do
    paginate(description, @page_init, @page_size)
  end

  def call(%{"page" => page, "page_size" => page_size}) do
    {page, _} = Integer.parse(page)
    {page_size, _} = Integer.parse(page_size)
    paginate(page, page_size)
  end

  def call(%{"page" => page}) do
    {page, _} = Integer.parse(page)
    paginate(page, @page_size)
  end

  def call(%{"page_size" => page_size}) do
    {page_size, _} = Integer.parse(page_size)
    paginate(@page_init, page_size)
  end

  def call(%{}) do
    paginate(@page_init, @page_size)
  end

  def call do
    paginate(@page_init, @page_size)
  end

  defp paginate(page, page_size) do
    total_size = count(Supply.Schema)

    query = from(s in Supply.Schema)

    paginate(query, page, page_size, total_size)
  end

  defp paginate(description, page, page_size) do
    total_size = count(Supply.Schema)

    query =
      from r in Supply.Schema,
        where: r.description == ^description,
        preload: [:restaurant]

    paginate(query, page, page_size, total_size)
  end
end
