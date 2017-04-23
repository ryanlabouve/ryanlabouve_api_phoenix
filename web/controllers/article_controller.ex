defmodule RyanlabouveApiPhoenix.ArticleController do
  use RyanlabouveApiPhoenix.Web, :controller
  require IEx

  alias RyanlabouveApiPhoenix.Article

  def index(conn, %{"filter" => %{"limit" => limit}}) do
    query = from a in Article,
              select: map(a, [:id, :title, :date, :slug]),
              limit: ^limit
    articles = Repo.all(query)
    render(conn, "index.json-api", articles: articles)
  end

  def index(conn, %{"filter" => %{"slug" => slug}}) do
    query = from a in Article,
      where: a.slug == ^slug
    articles = Repo.all(query)
    render(conn, "index.json-api", articles: articles)
  end

  def index(conn, %{"filter" => %{"term" => term}}) do
    query = from a in Article,
              select: map(a, [:id, :title, :date, :slug]),
              where: like(a.content, ^("%#{term}%"))
    articles = Repo.all(query)
    render(conn, "index.json-api", articles: articles)
  end

  def index(conn, _params) do
    query = from a in Article,
              select: map(a, [:id, :title, :date, :slug, :description]),
              order_by: [desc: :date]

    articles = Repo.all(query)
    render(conn, "index.json-api", articles: articles)
  end
end
