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
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should have_many(:goals) }


  subject(:user) do
    User.create!(
      username: "kyle",
      password: "starwars1"
    )
  end
 

  describe "password encryption" do
    it "does not save passwords to the database" do
      User.create!(username: "amin", password: "starwars")
      user = User.find_by(username: "amin")
      expect(user.password).not_to be("starwars")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "amin", password: "starwars")
    end
  end

end





