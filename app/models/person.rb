class Person < ActiveRecord::Base

  def sync

  end

  def self.sync!
    client = Octokit::Client.new(access_token: '')
    repo = client.repository 'rails/rails'
    client.auto_paginate = true
    client.paginate(repo.rels[:contributors].href) do |datas, contributors|
      puts contributors.inspect
      contributors.data.each do |contributor|
        puts contributor[:login]
        Person.find_or_create_by username: contributor[:login]
      end
    end
  end
end
