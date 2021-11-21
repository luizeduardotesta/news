defmodule News.Factory do
  use ExMachina.Ecto, repo: News.Repo

  use News.UserFactory
end
