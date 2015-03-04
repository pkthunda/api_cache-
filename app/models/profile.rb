class Profile < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  before_create :parse

  def initialize(username)
    @username = username
  end

  def self.create_from_username(username)
    response = HTTParty.get(
        "https://api.github.com/users/#{username}",
        :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                     "User-Agent" => "anyone"
                    }
    )
    if response["login"]
      Profile.create(body: response)
    else
      return nil
    end
  end

  private

  def parse
    number_following = body["following"]
    number_of_followers = body["followers"]
    company = body["company"]
    location = body["location"]
    avatar_url = body["avatar_url"]
    username = body["login"]
  end


end
