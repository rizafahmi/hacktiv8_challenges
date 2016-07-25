defmodule Hacktiv8Challenges.Batch do
  use Hacktiv8Challenges.Web, :model

  schema "batches" do
    field :name, :string
    field :nickname, :string
    field :number, :integer
    has_many :challenges, Hacktiv8Challenges.Challenge

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :nickname, :number])
    |> validate_required([:name, :nickname, :number])
  end

  def sort_by_number(query) do
    from b in query, order_by: b.number
  end

  def names_and_ids(query) do
    from b in query, select: {b.name, b.id}
  end
end
