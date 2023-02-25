defmodule Hello.MixProject do
  use Mix.Project

  def project do
    [
      app: :hello,
      version: "0.1.0",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      build_path: "/mix/_build",
      deps_path: "/mix/deps",
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [
      mod: {Hello.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:credo, "1.6.7", only: [:dev, :test], runtime: false},
      {:ecto_sql, "3.9.2"},
      {:excoveralls, "0.15.3", only: [:dev, :test]},
      {:finch, "0.14.0"},
      {:floki, ">= 0.34.0", only: :test},
      {:gettext, "0.22.0"},
      {:heroicons, "0.5.2"},
      {:jason, "1.4.0"},
      {:phoenix, "1.7.0"},
      {:phoenix_ecto, "4.4.0"},
      {:phoenix_html, "3.3.0"},
      {:phoenix_live_dashboard, "0.7.2"},
      {:phoenix_live_reload, "1.4.1", only: :dev},
      {:phoenix_live_view, "0.18.16"},
      {:plug_cowboy, "2.6.0"},
      {:postgrex, "0.16.5"},
      {:swoosh, "1.9.1"},
      {:telemetry_metrics, "0.6.1"},
      {:telemetry_poller, "1.0.0"}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get", "ecto.setup", "cmd npm install --prefix assets"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
