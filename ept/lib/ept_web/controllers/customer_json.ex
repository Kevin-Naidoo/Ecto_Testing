defmodule EptWeb.CustomerJSON do
  alias Ept.Customers.Customer

  @doc """
  Renders a list of customers.
  """
  def index(%{customers: customers}) do
    %{data: for(customer <- customers, do: data(customer))}
  end

  @doc """
  Renders a single customer.
  """
  def show(%{customer: customer}) do
    %{data: data(customer)}
  end

  defp data(%Customer{} = customer) do
    %{
      id: customer.id,
      firstname: customer.firstname,
      lastname: customer.lastname,
      phoneNumber: customer.phoneNumber,
      dateOfBirth: customer.dateOfBirth,
      idNumber: customer.idNumber,
      ficaComplete: customer.ficaComplete
    }
  end
end
