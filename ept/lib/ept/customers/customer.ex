defmodule Ept.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "customers" do
    field :dateOfBirth, :date
    field :ficaComplete, :boolean, default: false
    field :firstname, :string
    field :idNumber, :string
    field :lastname, :string
    field :phoneNumber, :string
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:firstname, :lastname, :phoneNumber, :dateOfBirth, :idNumber, :ficaComplete])
    |> validate_required([:firstname, :lastname, :phoneNumber, :dateOfBirth, :idNumber, :ficaComplete])
  end
end
