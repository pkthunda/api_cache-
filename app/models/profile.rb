class Profile < ActiveRecord
  validates :username, presence: true, uniqueness: true
  before_create :parse

  def self.create_from_username(username)
    response = HTTParty.get(
      "https://api.github.com/users/#{username}",
      :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}"
                  "User-Agent" => "anyone"
                  }
    )
    if response["login"]
      Profile.create(body: response)
    else
      return nil
    end
  end

  def initialize(username)
    @content = HTTParty.get(
        "https://api.github.com/users/#{username}",
        :headers => {"Authorization" => "token #{ENV['GITHUB_TOKEN']}",
                     "User-Agent" => "anyone"
                    }
    )
  end

  def username
    @content["login"]
  end

  def avatar_url
    @content["avatar_url"]
  end

  def location
    @content["location"]
  end

  def company_name
    @content["company"]
  end

  def number_of_followers
    @content["followers"]
  end

  def number_following
    @content["following"]
  end

  private

  def parse
    number_following = body["following"]
    #...
  end


end
