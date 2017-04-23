defmodule RyanlabouveApiPhoenix.Router do
  use RyanlabouveApiPhoenix.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/api", RyanlabouveApiPhoenix do
    pipe_through :api


    resources "/articles", ArticleController, only: [:index]
  end
end
