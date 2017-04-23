defmodule RyanlabouveApiPhoenix.ArticleController do
  use RyanlabouveApiPhoenix.Web, :controller
  require IEx

  alias RyanlabouveApiPhoenix.Article

  def index(conn, %{"filter" => %{"limit" => limit}}) do
    query = from a in Article,
      limit: ^limit
    articles = Repo.all(query)
    render(conn, "index.json", articles: articles)
  end

  def index(conn, %{"filter" => %{"slug" => slug}}) do
    query = from a in Article,
      where: a.slug == ^slug
    articles = Repo.all(query)
    render(conn, "index.json", articles: articles)
  end

  def index(conn, %{"filter" => %{"term" => term}}) do
    query = from a in Article,
      where: like(a.content, ^("%#{term}%"))
    articles = Repo.all(query)
    render(conn, "index.json", articles: articles)
  end

  def index(conn, _params) do
    query = from article in Article,
              order_by: [desc: :date]
    articles = Repo.all(query)
    render(conn, "index.json", articles: articles)
  end
end
