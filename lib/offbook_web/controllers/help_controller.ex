defmodule OffbookWeb.HelpController do
  use OffbookWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def topic(conn, %{"messenger" => messenger}) do
    render(conn, "topic.html", messenger: messenger)
  end
end
