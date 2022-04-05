defmodule Voting.Factory do
  @moduledoc """
  Creating factories
  """
  # with Ecto
  use ExMachina.Ecto, repo: MyApp.Repo

  def admin_factory do
    %Voting.Admin{
      name: "John Smith",
      email: sequence(:email, &"email-#{&1}@example.com"),
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end
end
