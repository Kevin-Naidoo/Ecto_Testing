defmodule Ept.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :password, :string
      add :isActive, :boolean, default: false, null: false
      add :lastLoginDate, :naive_datetime

      timestamps()
    end
  end
end
