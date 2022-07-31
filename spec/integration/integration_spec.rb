# frozen_string_literal: true

module Helper
  def print_row(row)
    row.each { |k, v| puts "#{k} => #{v}" }
  end

  module_function :print_row
end

RSpec.describe Mysql2 do
  before(:each) do
    @client = Mysql2::Client.new(host: "127.0.0.1", port: "3306", username: "root", password: "root")
  end

  after(:each) do
  end

  it "can execute query" do
    @client.query(%(SHOW DATABASES)).each { |row| Helper.print_row(row) }
    @client.query(%(use test))
    @client.query(%(SHOW TABLES)).each { |row| Helper.print_row(row) }
  end

  it "can create table and insert rows" do
  end
end

RSpec.describe TryRubyMysql do
  specify "2 + 2 = 4" do
    expect(2 + 2).to eq 4
  end
end
