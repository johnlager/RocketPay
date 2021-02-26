defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.Account

  alias Rocketpay.Accounts.Transactions.Response, as: TransactionResponse

  def render("update.json", %{
        account: %Account{
          id: account_id,
          balance: balance
        }
      }) do
    %{
      message: "Ballance changed succesfully",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{
        transaction: %TransactionResponse{
          from_account: %Account{
            id: from_account_id,
            balance: from_account_balance
          },
          to_account: %Account{
            id: to_account_id,
            balance: to_account_balance
          }
        }
      }) do
    %{
      message: "Transaction done succesfully",
      transaction: %{
        from_account: %{
          id: from_account_id,
          balance: from_account_balance
        },
        to_account: %{
          id: to_account_id,
          balance: to_account_balance
        }
      }
    }
  end
end
