defmodule Voting.Admin do
  use Ecto.Schema

  schema "administrators" do
    field :email, :string, null: false
    field :name, :string, null: false
    field :password, :string, virtual: true
    field :password_hash, :string, null: false

    timestamps()
  end

  @moduledoc """
  @spec changeset(
    {map, map}
    | %{
        :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
        optional(atom) => any
      },
    :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
  ) :: Ecto.Changeset.t()
  """
end
