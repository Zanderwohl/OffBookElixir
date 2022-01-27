defmodule OffbookWeb.PowInvitation.MailerView do
  use OffbookWeb, :mailer_view

  def subject(:invitation, _assigns), do: "You've been invited"
end
