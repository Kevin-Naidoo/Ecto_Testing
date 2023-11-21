defmodule Ept.CustomersTest do
  use Ept.DataCase

  alias Ept.Customers

  describe "customers" do
    alias Ept.Customers.Customer

    import Ept.CustomersFixtures

    @invalid_attrs %{dateOfBirth: nil, ficaComplete: nil, firstname: nil, idNumber: nil, lastname: nil, phoneNumber: nil}

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Customers.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Customers.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      valid_attrs = %{dateOfBirth: ~D[2023-11-20], ficaComplete: true, firstname: "some firstname", idNumber: "some idNumber", lastname: "some lastname", phoneNumber: "some phoneNumber"}

      assert {:ok, %Customer{} = customer} = Customers.create_customer(valid_attrs)
      assert customer.dateOfBirth == ~D[2023-11-20]
      assert customer.ficaComplete == true
      assert customer.firstname == "some firstname"
      assert customer.idNumber == "some idNumber"
      assert customer.lastname == "some lastname"
      assert customer.phoneNumber == "some phoneNumber"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Customers.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      update_attrs = %{dateOfBirth: ~D[2023-11-21], ficaComplete: false, firstname: "some updated firstname", idNumber: "some updated idNumber", lastname: "some updated lastname", phoneNumber: "some updated phoneNumber"}

      assert {:ok, %Customer{} = customer} = Customers.update_customer(customer, update_attrs)
      assert customer.dateOfBirth == ~D[2023-11-21]
      assert customer.ficaComplete == false
      assert customer.firstname == "some updated firstname"
      assert customer.idNumber == "some updated idNumber"
      assert customer.lastname == "some updated lastname"
      assert customer.phoneNumber == "some updated phoneNumber"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Customers.update_customer(customer, @invalid_attrs)
      assert customer == Customers.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Customers.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Customers.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Customers.change_customer(customer)
    end
  end
end
