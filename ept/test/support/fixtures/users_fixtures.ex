defmodule Ept.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ept.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        isActive: true,
        lastLoginDate: ~N[2023-11-20 08:30:00],
        password: "some password"
      })
      |> Ept.Users.create_user()

    user
  end
end
