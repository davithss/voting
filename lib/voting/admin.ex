defmodule Voting.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "administrators" do
    field :email, :string, null: false
    field :name, :string, null: false
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
  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:name, :email, :password_hash])
    |> validate_required([:name, :email, :password_hash])
  end
end
