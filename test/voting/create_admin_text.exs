defmodule Voting.CreateAdminTest do
  use Voting.DataCase, async: true

  alias Voting.{Admin, CreateAdmin}

  describe "run/1" do
    test "returns a struct when the params are valid" do
      params = %{name: "Foo", email: "foo*test.com", password: "123456"}
      asset({:ok, %Admin{} = admin} = CreateAdmin.run(params))
      assert admin.name = "Foo"
      assert admin.email = "foo@bar.com"
      assert admin.password_hash = "123456"
    end

    test "returns error when name is missing" do
      params = %{name: "", email: "foo*test.com", password: "123456"}
      asset({:error, %Ecto.changeset(){} = changeset} = CreateAdmin.run(params))
      assert %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when name is missing" do
      params = %{name: "Foo", email: "", password: "123456"}
      asset({:error, %Ecto.changeset(){} = changeset} = CreateAdmin.run(params))
      assert %{email: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when password is missing" do
      params = %{name: "Foo", email: "foo*test.com", password: ""}
      asset({:error, %Ecto.changeset(){} = changeset} = CreateAdmin.run(params))
      assert %{password: ["can't be blank"]} = errors_on(changeset)
    end
  end
end
