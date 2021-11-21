defmodule News.AccountsTest do
  use News.DataCase

  import News.Factory
  alias News.Accounts

  describe "users" do
    alias News.Accounts.User

    test "list_users/0 returns all users" do
      user = insert(:user)
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = insert(:user)
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", name: "some name", password: "some password"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      params = %{}
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(params)
    end

    test "update_user/2 with valid data updates the user" do
      user = insert(:user)
      update_attrs = %{email: "some updated email", name: "some updated name", password: "some updated password"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      fisrt = insert(:user, %{email: "qwer@gmail.com"})
      user = insert(:user)

      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, %{email: fisrt.email})
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = insert(:user)
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = insert(:user)
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
