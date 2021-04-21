defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send,
    do:
      GetByExpiration.call()
      |> ExpirationEmail.create()
      |> Enum.each(&Mailer.deliver_later!(&1))
end
