defmodule Hacktiv8Challenges.Repo.Migrations.AddBatchReference do
  use Ecto.Migration

  def change do
    alter table(:challenges) do
      add :batch_id, references(:batches, on_delete: :nothing)
    end
  end
end
