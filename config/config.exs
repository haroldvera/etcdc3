import Config
config :etcdc, :etcd_url, "http://localhost:2379/v3"

import_config "#{Mix.env()}.exs"
