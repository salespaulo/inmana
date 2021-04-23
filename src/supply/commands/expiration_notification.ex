defmodule Inmana.Supply.ExpirationNotification do
  alias Inmana.Mailer
  alias Inmana.Supply.{ExpirationEmail, GetByExpiration}

  def send do
    Task.async(fn -> send_async() end)
    |> Task.await()
  end

  def send_async do
    GetByExpiration.call()
    |> ExpirationEmail.create()
    |> Mailer.send_emails()
    |> Stream.run()
  end
end
