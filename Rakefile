# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "standard/rake"

DOCKER_DIR = ".docker"

task default: [:spec, :standard]

RSpec::Core::RakeTask.new(:spec)

namespace :spec do
  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = Dir["spec/*/**/*_spec.rb"].reject { |f| f && f["/integration"] }
  end

  RSpec::Core::RakeTask.new(:integration) do |t|
    t.pattern = "spec/integration/**/*_spec.rb"
  end
end

namespace :docker do
  task :up do
    Dir.chdir(DOCKER_DIR) do
      `docker compose up -d`
    end
  end
end
