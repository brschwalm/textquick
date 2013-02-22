class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :name, :email, :password_digest, :password, :password_confirmation
end