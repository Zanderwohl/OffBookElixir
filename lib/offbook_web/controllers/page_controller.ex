defmodule OffbookWeb.PageController do
  use OffbookWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
