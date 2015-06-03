class User < ActiveRecord::Base
  has_many :questions

	validates_presence_of :name, :uid, :provider


	def self.find_or_create(auth_hash)
    unless user = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      user = User.create name: auth_hash["info"]["nickname"], picture: auth_hash["info"]["image"], email: auth_hash["info"]["email"], uid: auth_hash["uid"], provider: auth_hash["provider"]
    end
    user
  end
end
