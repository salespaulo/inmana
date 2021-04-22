defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email
  alias Inmana.Supply

  @email_subject "Supplies to expire em forma de texto(string):\n"

  def create(supplies_groupby_restaurant_email) do
    supplies_groupby_restaurant_email
    |> Task.async_stream(fn supplies_by_email ->
      new_supplies_by_email(supplies_by_email)
    end)
  end

  defp new_supplies_by_email({email, supplies}),
    do:
      new_email(
        to: email,
        from: "app@inmana.com.br",
        subject: @email_subject,
        text_body: email_text(supplies)
      )

  defp email_text(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }),
       do:
         "Desc: " <>
           description <>
           "; Exp.: " <> Date.to_string(expiration_date) <> "Resp.: " <> responsible

  defp email_text(supplies),
    do:
      supplies
      |> Enum.reduce(@email_subject, fn supply, text_reduce ->
        text_reduce <> "\n" <> email_text(supply)
      end)
end
