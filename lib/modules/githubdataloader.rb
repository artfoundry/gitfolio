require 'uri'
require 'net/http'
require 'json'

module GitHubDataLoader

  extend self

  def return_all_repos(username)
    uri_string =  "https://api.github.com/users/#{username}/repos"
    repositories = make_api_call(uri_string)

    #returns an array of hashes, each pertaining to a single repository
    repositories.map do |repo_hash|
      {name: repo_hash["name"],
        url: repo_hash["html_url"],
        description: repo_hash["description"],
        owner: repo_hash["owner"]["login"]
      }
    end

  end

  def return_all_files(username)

    return_all_gists(username) + return_all_repos(username)

  end

  def return_all_gists(username)
    uri_string = "https://api.github.com/users/#{username}/gists"
    gists = make_api_call(uri_string)

    gists.map do |gist_hash|
      {name: "gist " + gist_hash["id"],
        url: gist_hash["url"],
        description: gist_hash["description"],
        owner: gist_hash["user"]["login"]
      }
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

  def make_api_call(uri_string)
    #makes a single api call.

    uri = URI.parse(uri_string)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)
    request.basic_auth("robotdinosaur",'password2')
    JSON.parse(http.request(request).body)

  end

end

p GitHubDataLoader.return_all_files('raorao')