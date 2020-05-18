defmodule LatencySimulator do


  use Plug.Router

  #plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)



  get "/wait/:time_to_wait" do
    case Integer.parse time_to_wait do
      {int_time, _} ->
        Process.sleep(int_time)
        send_resp(conn, 200, "OK After #{int_time} milliseconds")
      :error ->
        send_resp(conn, 500, "Please specify an integer in the form: /wait/:time_to_wait")
    end
  end


  match _ do
    send_resp(conn, 404, "oops... Nothing here :(")
  end

end
