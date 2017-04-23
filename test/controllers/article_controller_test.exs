defmodule RyanlabouveApiPhoenix.ArticleControllerTest do
  use ExUnit.Case, async: false
  use Plug.Test
  alias RyanlabouveApiPhoenix.Article
  alias RyanlabouveApiPhoenix.Repo
  alias Ecto.Adapters.SQL

  setup do
    SQL.begin_test_transaction(Repo)

    on_exit fn ->
      SQL.rollback_test_transaction(Repo)
    end
  end

  test "GET /article returns a list of all articles" do

  end
end
