class User < ActiveRecord::Base
  has_many :tasks
  validates :email, :name, :user_id, :provider, presence: true

  def self.build_from_github(auth_hash)
    user       = User.new
    user.user_id   = auth_hash[:uid]
    user.provider = 'github'
    user.name  = auth_hash['info']['name']
    user.email = auth_hash['info']['email']
    user.avatar = auth_hash["extra"]["raw_info"]['avatar_url']
    user.follower_count = auth_hash["extra"]["raw_info"]["followers"].to_i

    return user
  end
end
