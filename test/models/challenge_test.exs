defmodule Hacktiv8Challenges.ChallengeTest do
  use Hacktiv8Challenges.ModelCase

  alias Hacktiv8Challenges.Challenge

  @valid_attrs %{date_publish: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, published: true, url: "some content", week: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Challenge.changeset(%Challenge{}, @invalid_attrs)
    refute changeset.valid?
  end
end
