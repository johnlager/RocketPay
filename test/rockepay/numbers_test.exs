defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "when theres a file with the given name, returns the sum of the numbers" do
      response = Numbers.sum_from_file("numbers")

      expected_respone = {:ok, %{result: 37}}

      assert response == expected_respone
    end

    test "when theres no file with the given name, returns an error" do
      response = Numbers.sum_from_file("number")

      expected_respone = {:error, %{message: "Invalid file!"}}

      assert response == expected_respone
    end
  end
end
