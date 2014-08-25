stack = Faraday::RackBuilder.new do |builder|
  builder.use Faraday::HttpCache, store: Rails.cache
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end
Octokit.netrc = true
Octokit.middleware = stack
Octokit.auto_paginate = true
