defmodule RyanlabouveApiPhoenix.ArticleTest do
  use RyanlabouveApiPhoenix.ModelCase

  alias RyanlabouveApiPhoenix.Article

  @valid_attrs %{content: "some content", date: %{day: 17, month: 4, year: 2010}, description: "some content", slug: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end
end
