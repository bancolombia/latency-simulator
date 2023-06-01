import Config

config :git_hooks,
  auto_install: true,
  hooks: [
    pre_commit: [
      verbose: true,
      tasks: [
        {:file, "./hooks/mix_format"},
        {:mix_task, :format, ["--check-formatted", "--dry-run"]},
        {:mix_task, :test, ["--color", "--cover"]},
        {:mix_task, :credo,
         [
           "--sonarqube-base-folder",
           "./",
           "--sonarqube-file",
           "credo_sonarqube.json",
           "--mute-exit-status"
         ]},
        {:mix_task, :sobelow}
      ]
    ]
  ]

if Mix.env() == :test do
  config :git_hooks, current_branch_fn: fn -> {"main\n", 0} end
end

config :latency_simulator,
  file_parser_behaviour: LatencySimulator.Infrastructure.Adapters.FileSystem

import_config "#{Mix.env()}.exs"
