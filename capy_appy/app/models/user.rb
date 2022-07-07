# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password
    after_initialize :ensure_session_token
    
    validates :username, :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 6 }, allow_nil: true

    has_many :goals,
    foreign_key: :user_id,
    class_name: :Goal

    def User.find_by_credential(username, password)
        @user = User.find_by(username: username, password: password)

        if @user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end



end


