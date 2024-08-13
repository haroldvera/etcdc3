defmodule Etcdc do
  use Tesla

  # Fetch the etcd URL from config at compile time
  @etcd_url System.get_env("ETCD_URL") || "http://localhost:4001/v3"
  # Use the JSON middleware for Tesla

  plug(Tesla.Middleware.JSON)

  @doc """
  Set a key-value pair in etcd.
  """
  def set_m(key, value) do
    url = "#{@etcd_url}/kv/put"

    body = %{
      "key" => Base.encode64(key),
      "value" => Base.encode64(value)
    }

    case post(url, body) do
      {:ok, %Tesla.Env{status: 200}} ->
        :ok

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc """
  Get a value by key from etcd.
  """
  def get_m(key) do
    url = "#{@etcd_url}/kv/range"

    body = %{
      "key" => Base.encode64(key)
    }

    case post(url, body) do
      {:ok, %Tesla.Env{status: 200, body: response_body}} ->
        case response_body["kvs"] do
          [kv | _] ->
            decoded_value = Base.decode64!(kv["value"])
            {:ok, decoded_value}

          _ ->
            {:error, :not_found}
        end

      {:error, reason} ->
        IO.puts("response body: #{inspect(reason)}")
        {:error, reason}
    end
  end
end
