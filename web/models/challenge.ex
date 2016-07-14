defmodule Hacktiv8Challenges.Challenge do
  use Hacktiv8Challenges.Web, :model

  schema "challenges" do
    field :week, :string
    field :url, :string
    field :published, :boolean, default: false
    field :date_publish, Ecto.DateTime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:week, :url, :published, :date_publish])
    |> validate_required([:week, :url, :published, :date_publish])
  end
end
