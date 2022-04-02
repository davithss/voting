defmodule Voting.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: MyApp.Repo

  def user_factory do
    %Voting.Admin{
      name: "Jane Smith",
      email: sequence(:email, &"email-#{&1}@example.com"),
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end
end
