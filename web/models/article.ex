defmodule RyanlabouveApiPhoenix.Article do
  use RyanlabouveApiPhoenix.Web, :model

  schema "articles" do
    field :content, :string
    field :date, Ecto.Date
    field :description, :string
    field :slug, :string
    field :title, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content, :date, :description, :slug, :title])
    |> validate_required([:content, :date, :description, :slug, :title])
  end
end
