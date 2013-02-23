class User < ActiveRecord::Base
  attr_accessible :admin, :name, :provider, :uid, :is_blocked

  has_many :contacts

  #Class-level method to create a new user from an OmniAuth Auth Token
  def User.create_omni_auth(auth)
    user = User.new()
    user.name = auth["info"]["name"]
    user.uid = auth["uid"]
    user.provider = auth["provider"]
    user.save

    return user

  end

  def favorite_contacts
    self.contacts.select { |c| c.is_favorite? }
  end

end
