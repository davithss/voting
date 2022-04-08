defmodule Voting.Election do
  @moduledoc """
  Election schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Voting.Admin

  schema "elections" do
    field :cover, :string
    field :end_at, :utc_datetime
    field :name, :string
    field :notice, :string
    field :starts_at, :utc_datetime
    belongs_to :created_by, Admin

    timestamps()
  end

  @doc false
  def changeset(election, attrs) do
    election
    |> cast(attrs, [:name, :cover, :notice, :starts_at, :end_at])
    |> validate_required([:name, :cover, :notice, :starts_at, :end_at])
  end
end
