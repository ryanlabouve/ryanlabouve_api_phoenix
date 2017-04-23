defmodule Mix.Tasks.SeedBlog.Init do
  use Mix.Task
  require IEx

  import Mix.Ecto
  import Ecto.Query
  alias RyanlabouveApiPhoenix.Repo
  alias RyanlabouveApiPhoenix.Article

  def read_manifest(filename) do
    {:ok, body} = File.read(filename)
    case Poison.decode(body) do
      {:ok, json} -> {:ok, json}
      {:error, error} -> IO.puts("ERROR reading manifest", error)
    end
  end

  def clone_repo do
    {:ok, _} = Git.clone "https://github.com/ryanlabouve/ryanlabouve-articles"
  end

  def cleanup do
    File.rm_rf! "ryanlabouve-articles"
  end

  def process_article(article) do
    {:ok, html} = File.read("./ryanlabouve-articles/" <> article["content"])

    {:ok, date} = Ecto.Date.cast(article["date"])

    changes = %{
      "content" => html,
      "date" => date,
      "description" => article["description"],
      "slug" => article["slug"],
      "title" => article["title"],
    }

    slug = article["slug"]
    query = from a in Article,
      where: a.slug == ^slug

    existing_article = Repo.one(query)
    if existing_article do
      Article.changeset(existing_article, changes)
      |> Repo.update!
    else
      Article.changeset(%Article{}, changes)
      |> Repo.insert!
    end
  end

  def run(_) do
    IO.puts "Running"
    ensure_started(RyanlabouveApiPhoenix.Repo, [])

    cleanup()
    clone_repo()
    {_, manifest} = read_manifest("./ryanlabouve-articles/manifest.json")
    Enum.each(manifest, fn(article) -> process_article(article) end)
    cleanup()
  end
end
