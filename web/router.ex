defmodule RyanlabouveApiPhoenix.Router do
  use RyanlabouveApiPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RyanlabouveApiPhoenix do
    pipe_through :api
    resources "/articles", ArticlesController, only: [:index]
  end
end
