defmodule VotingWeb.Admin.SessionAdminTest do
  use ExUnit.Case, async: true
  alias VotingWeb.Admin.SessionView

  test "render/2 returns ok and the admin data" do
    assert %{status: "ok", data: %{name: "Admin name"}} =
             SessionView.render("session.json", %{admin: %{name: "Admin name"}})
  end
end
