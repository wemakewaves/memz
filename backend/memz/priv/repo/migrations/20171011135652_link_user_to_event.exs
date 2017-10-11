defmodule Memz.Repo.Migrations.LinkUserToEvent do
  use Ecto.Migration

  def change do

    alter table(:events) do
      remove :owner
      add :user_id, references(:users), null: false
    end

    create index(:events, [:user_id])

  end


end
