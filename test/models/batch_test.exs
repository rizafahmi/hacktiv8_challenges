defmodule Hacktiv8Challenges.BatchTest do
  use Hacktiv8Challenges.ModelCase

  alias Hacktiv8Challenges.Batch

  @valid_attrs %{name: "some content", nickname: "some content", number: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Batch.changeset(%Batch{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Batch.changeset(%Batch{}, @invalid_attrs)
    refute changeset.valid?
  end
end
