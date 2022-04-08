defmodule VotingWeb.AuthAccessPipeline do
  @moduledoc """
    Auth pipelines
  """
  use Guardian.Plug.Pipeline, otp_app: :voting

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
