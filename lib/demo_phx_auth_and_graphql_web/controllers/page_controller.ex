defmodule DemoPhxAuthAndGraphqlWeb.PageController do
  use DemoPhxAuthAndGraphqlWeb, :controller

  alias DemoPhxAuthAndGraphql.Accounts

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def test(conn, %{"email" => email, "password" => password} = _params) do
    if user = Accounts.get_user_by_email_and_password(email, password) do
      user |> IO.inspect()
      DemoPhxAuthAndGraphqlWeb.Endpoint.broadcast!(
        "order_respond:lobby",
        "order_respond",
        "Hello World!"
      )
      conn
      |> put_resp_content_type("application")
      |> send_resp(200, Poison.encode!(%{Message: "Successful!", RspCode: "02"}))
    else
      conn
      |> put_resp_content_type("application")
      |> send_resp(200, Poison.encode!(%{Message: "Required Authentication!", RspCode: "01"}))
    end
  end
end
