defmodule OffbookWeb.PowResetPassword.MailerView do
  use OffbookWeb, :mailer_view

  def subject(:reset_password, _assigns), do: "Reset password link"
end
