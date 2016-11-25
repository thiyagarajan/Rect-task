require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without an email' do
    expect(build(:user, email: ' ')).not_to be_valid
  end

  it 'password have to be longer then 6 characters' do
    expect(build(:user, password: 'a' * 3)).not_to be_valid
    expect(build(:user, password: 'a' * 7)).to be_valid
  end

  it 'is invalid when the email is already taken' do
    user = create(:user)

    expect(build(:user, email: user.email)).not_to be_valid
  end
end
