defmodule Rocketpay.Users.Create do
  alias Rocketpay.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
