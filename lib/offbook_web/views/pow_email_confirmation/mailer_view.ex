defmodule OffbookWeb.PowEmailConfirmation.MailerView do
  use OffbookWeb, :mailer_view

  def subject(:email_confirmation, _assigns), do: "Confirm your email address"
end
