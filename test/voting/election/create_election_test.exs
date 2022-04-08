defmodule Voting.CreateElectionTest do
  use Voting.DataCase, async: true
  import Voting.Factory
  alias Voting.{CreateElection, Election}

  describe "run/1" do
    test "returns a struct when the params are valid" do
      admin = insert(:admin)
      params = %{name: "Foo", cover: "url", notice: "url", starts_at: ~U[2022-02-01 11:00:00Z], end_at: ~U[2022-02-28 11:00:00Z], created_by_id: admin.id}
      assert({:ok, %Election{} = election} = CreateElection.run(params))

      assert election.name == "Foo"
      assert election.cover == "url"
      assert election.notice == "url"
      assert election.starts_at == ~U[2022-02-01 11:00:00Z]
      assert election.end_at == ~U[2022-02-28 11:00:00Z]
      assert election.created_by_id == admin.id
    end

    test "returns error when name is missing" do
      params = %{name: "", cover: "url", notice: "url", starts_at: ~U[2022-02-01 11:00:00Z], end_at: ~U[2022-02-28 11:00:00Z]}

      assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
      assert %{name: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when starts_at is missing" do
      params = %{name: "Foo", cover: "url", notice: "url", starts_at: nil, end_at: ~U[2022-02-28 11:00:00Z]}
      assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
      assert %{starts_at: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when end_at is missing" do
      params = %{name: "Foo", cover: "url", notice: "url", starts_at: ~U[2022-02-01 11:00:00Z], end_at: nil}

      assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
      assert %{end_at: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when admin is missing" do
      params = %{name: "Foo", cover: "url", notice: "url", starts_at: ~U[2022-02-01 11:00:00Z], end_at: ~U[2022-02-28 11:59:00Z]}

      assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
      assert %{created_by_id: ["can't be blank"]} = errors_on(changeset)
    end

    test "returns error when starts at is greater than end at" do
      params = %{name: "Foo", cover: "url", notice: "url", starts_at: ~U[2022-03-01 11:00:00Z], end_at: ~U[2022-02-28 11:59:00Z], created_by_id: 99}

      assert {:error, %Ecto.Changeset{} = changeset} = CreateElection.run(params)
      assert %{starts_at: ["should be before end_at"]} = errors_on(changeset)
    end
  end
end
