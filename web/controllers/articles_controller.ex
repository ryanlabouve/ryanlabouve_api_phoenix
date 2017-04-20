defmodule RyanlabouveApiPhoenix.ArticlesController do
  use RyanlabouveApiPhoenix.Web, :controller

  def index(conn, _params) do
    conn
    |> json(%{status: "ok"})
  end
end
