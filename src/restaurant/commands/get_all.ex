defmodule Inmana.Restaurant.GetAll do
  alias Inmana.{Core, Restaurant}
  use Core.Command

  def call(%{"email" => email, "page" => page, "page_size" => page_size}) do
    {page, _} = Integer.parse(page)
    {page_size, _} = Integer.parse(page_size)
    paginate(email, page, page_size)
  end

  def call(%{"email" => email, "page" => page}) do
    {page, _} = Integer.parse(page)
    paginate(email, page, @page_size)
  end

  def call(%{"email" => email, "page_size" => page_size}) do
    {page_size, _} = Integer.parse(page_size)
    paginate(email, @page_init, page_size)
  end

  def call(%{"email" => email}) do
    paginate(email, @page_init, @page_size)
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
    page = if page < 0, do: @page_init, else: page
    page_size = if page_size <= 0, do: @page_size, else: page_size
    total_size = count(Restaurant.Schema)

    query = from(Restaurant.Schema)
    paginate(query, page, page_size, total_size)
  end

  defp paginate(email, page, page_size) do
    page = if page < 0, do: @page_init, else: page
    page_size = if page_size <= 0, do: @page_size, else: page_size
    total_size = count(Restaurant.Schema)

    query =
      from r in Restaurant.Schema,
        where: r.email == ^email

    paginate(query, page, page_size, total_size)
  end
end
