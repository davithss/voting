defmodule VotingWeb.Admin.SessionAdminTest do
  use ExUnit.Case, async: true
  alias VotingWeb.Admin.SessionView
  import Voting.Factory

  test "render/2 returns ok and the admin data" do
    admin = params_for(:admin, name: "John Smith")

    assert %{status: "ok", data: %{name: "John Smith", token: "Foo"}} =
             SessionView.render("session.json", %{admin: admin, token: "Foo"})
  end
end
