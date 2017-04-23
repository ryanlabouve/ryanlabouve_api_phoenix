defmodule RyanlabouveApiPhoenix.ArticleControllerTest do
  use RyanlabouveApiPhoenix.ConnCase

  alias RyanlabouveApiPhoenix.Article

  require IEx

  @valid_attrs %{
    content: "<h1>Title!</h1>",
    date: Ecto.Date.utc,
    description: "some content",
    slug: "article-1",
    title: "Sample Title",
  }

  @invalid_attrs %{}

  setup %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end

  test "lists all articles on index", %{conn: conn} do
    conn = get conn, article_path(conn, :index)
    # IEx.pry
    assert json_response(conn, 200)["data"] == []
  end
end
