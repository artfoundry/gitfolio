require 'uri'
require 'net/http'
require 'JSON'

module GitHubDataLoader

  extend self

  def return_all_repos(username)
    uri_string =  "https://api.github.com/users/#{username}/repos"
    repositories = make_api_call(uri_string)

    #returns an array of hashes, each pertaining to a single repository
    repositories.map do |repo_hash|
      {name: repo_hash["name"],
        url: repo_hash["url"],
        description: repo_hash["description"]}
    end

  end

  def return_user_info(username)
    uri_string = "https://api.github.com/users/#{username}"
    user_info = make_api_call(uri_string)

    #returns a hash of user attributes.
    user_info = {
      github_url: user_info["url"],
      github_avatar_link: user_info["avatar_url"],
      github_email: user_info["email"]
    }
  end

  def make_api_call(uri)
    #makes a single api call.
    response = Net::HTTP.get_response(URI.parse(uri))
    repositories = JSON.parse(response.body)
  end

end


