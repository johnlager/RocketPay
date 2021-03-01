defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns user" do
      params = %{
        name: "joao",
        password: "1234567",
        nickname: "Johnlager__",
        email: "joaoao@joao.com",
        age: 20
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "joao", id: ^user_id} = user
    end

    test "when all params are invalid, returns an error" do
      params = %{
        name: "joao",
        email: "joaoao@joao.com",
        age: 14
      }

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        nickname: ["can't be blank"],
        password: ["can't be blank"]
      }

      {:error, changeset} = Create.call(params)

      assert errors_on(changeset) == expected_response
    end
  end
end
