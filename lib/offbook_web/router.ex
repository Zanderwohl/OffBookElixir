defmodule OffbookWeb.Router do
  use OffbookWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowEmailConfirmation, PowPersistentSession, PowInvitation]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug OffbookWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do # configuration is assigned to conn.private[:pow_config]
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  scope "/", OffbookWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/help", HelpController, :index
    get "/help/:messenger", HelpController, :topic
	  resources "/departments", DepartmentController
  end

  # Other scopes may use custom stacks.
  # scope "/api", OffbookWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: OffbookWeb.Telemetry
    end
  end
end
