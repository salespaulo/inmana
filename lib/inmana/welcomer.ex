defmodule Inmana.Welcomer do
  def welcome(%{"name" => name, "age" => age}) do
    age = age |> String.to_integer()

    name
    |> String.trim()
    |> String.downcase()
    |> eval(age)
  end

  defp eval(name, age) when age >= 18 do
    {:ok, "Olá, #{name}, você já é maior de idade, #{age}, parabéns!"}
  end

  defp eval(name, age) do
    {:error, "Olá, #{name}, você não é maior de idade, #{age}, você não pode tirar CNH!"}
  end
end
