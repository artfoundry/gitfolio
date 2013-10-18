class Authorization < ActiveRecord::Base
  belongs_to :developer
  validates :provider, :uid, :presence => true

  def self.find_or_create(auth_hash)
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])

      developer = Developer.create(github_username: auth_hash["extra"]["raw_info"]["login"])
      auth = create(
        developer_id: developer.id,
        provider: auth_hash["provider"],
        uid: auth_hash["uid"])
    end

    auth
  end

end