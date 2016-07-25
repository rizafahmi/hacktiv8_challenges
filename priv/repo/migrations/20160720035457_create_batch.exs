defmodule Hacktiv8Challenges.Repo.Migrations.CreateBatch do
  use Ecto.Migration

  def change do
    create table(:batches) do
      add :name, :string
      add :nickname, :string
      add :number, :integer

      timestamps()
    end

  end
end
