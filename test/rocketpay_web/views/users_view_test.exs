defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "joao",
      password: "1234567",
      nickname: "Johnlager__",
      email: "joaoao@joao.com",
      age: 20
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rocketpay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{balance: Decimal.new("0.0"), id: account_id},
        id: user_id,
        name: "joao",
        nickname: "Johnlager__"
      }
    }

    assert expected_response == response

  end
end
