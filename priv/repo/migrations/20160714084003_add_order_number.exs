defmodule Hacktiv8Challenges.Repo.Migrations.AddOrderNumber do
  use Ecto.Migration

  def change do
    alter table(:challenges) do
      add :order_number, :integer
    end
  end
end
