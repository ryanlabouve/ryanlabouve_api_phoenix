defmodule RyanlabouveApiPhoenix.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :content, :text
      add :date, :date
      add :description, :string
      add :slug, :string
      add :title, :string

      timestamps()
    end

  end
end
