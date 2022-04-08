defmodule Voting.Factory do
  @moduledoc """
  Creating factories
  """
  # with Ecto
  use ExMachina.Ecto, repo: Voting.Repo

  def admin_factory do
    %Voting.Admin{
      name: "John Smith",
      email: sequence(:email, &"email-#{&1}@example.com"),
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end

  def election_factory do
    %Voting.Election{
      name: "Election 2022",
      cover: "http-to-an-image",
      notice: "http-to-pdf",
      starts_at: ~U[2022-02-01 11:00:00Z],
      end_at: ~U[2022-02-28 11:59:59Z],
      created_by: build(:admin)
    }
  end
end
