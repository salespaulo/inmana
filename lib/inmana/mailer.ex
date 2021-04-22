defmodule Inmana.Mailer do
  use Bamboo.Mailer, otp_app: :inmana

  def send_emails(emails) do
    emails
    |> Stream.map(&send_email!(&1))
  end

  def send_email!({:ok, email}) do
    deliver_later!(email)
  end
end
