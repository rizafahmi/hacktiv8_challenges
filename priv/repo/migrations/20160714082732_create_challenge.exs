defmodule Hacktiv8Challenges.Repo.Migrations.CreateChallenge do
  use Ecto.Migration

  def change do
    create table(:challenges) do
      add :week, :string
      add :url, :string
      add :published, :boolean, default: false, null: false
      add :date_publish, :datetime

      timestamps()
    end

  end
end
