defmodule Rocketpay.Accounts.Transactions.Response do
  alias Rocketpay.Account

  defstruct [:from_account, :to_account]

  def build(%Account{} = from_account, %Account{} = to_account) do
    # returns this struct
    # %Rocketpay.Accounts.Transactions.Response{from_account, to_account}
    %__MODULE__{from_account: from_account, to_account: to_account}
  end
end
