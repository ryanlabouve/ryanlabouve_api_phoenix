defmodule RyanlabouveApiPhoenix.ArticleView do
  use RyanlabouveApiPhoenix.Web, :view
  use JaSerializer.PhoenixView
  attributes [
    :id,
    :content,
    :date,
    :description,
    :slug,
    :title,
  ]
end
