defmodule Inmana.Supplies.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    Task.async(fn -> send_async() end)
    |> Task.await(10000)
  end

  def send_async do
    GetByExpiration.call()
    |> ExpirationEmail.create()
    |> Mailer.send_emails()
    |> Stream.run()
  end
end
