[
  import_deps: [:ecto, :phoenix],
  inputs: ["*.{ex,exs}", "priv/*/seeds.exs", "{config,src,lib,test}/**/*.{ex,exs}"],
  subdirectories: ["priv/*/migrations"]
]
