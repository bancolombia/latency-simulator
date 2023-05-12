import Config

config :git_hooks,
  auto_install: true,
  hooks: [
    pre_commit: [
      verbose: true,
      tasks: [
        {:file, "./hooks/mix_format"}
      ]
    ]
  ]
