defmodule Ept.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :isActive, :boolean, default: false
    field :lastLoginDate, :naive_datetime
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :isActive, :lastLoginDate])
    |> validate_required([:email, :password, :isActive, :lastLoginDate])
  end
end
