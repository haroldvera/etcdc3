import Config

config :etcdc,
       :etcd_url,
       System.get_env("ETCD_URL") || "http://localhost:4001/v3"
