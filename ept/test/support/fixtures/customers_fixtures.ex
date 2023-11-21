defmodule Ept.CustomersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ept.Customers` context.
  """

  @doc """
  Generate a customer.
  """
  def customer_fixture(attrs \\ %{}) do
    {:ok, customer} =
      attrs
      |> Enum.into(%{
        dateOfBirth: ~D[2023-11-20],
        ficaComplete: true,
        firstname: "some firstname",
        idNumber: "some idNumber",
        lastname: "some lastname",
        phoneNumber: "some phoneNumber"
      })
      |> Ept.Customers.create_customer()

    customer
  end
end
