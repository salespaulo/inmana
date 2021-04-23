defmodule Inmana.Restaurant do
  alias Inmana.Restaurant.Create

  defdelegate create(params), to: Create, as: :call
end
