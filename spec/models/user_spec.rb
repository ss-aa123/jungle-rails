require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    
    it 'the user has name, email, and password fields' do
      @user = User.new(
        name: "first",
        email: "user@email.com",
        password: "test",
        password_confirmation: "test")
      @user.save
      expect(@user).to be_present
    end

    it 'is not valid without a password' do
      @user = User.create({
        name: "first",
        email: "user@email.com",
        password: nil
      })
      expect(@user).not_to be_valid
    end

    it 'is not valid without password_confirmation' do
      @user = User.create({
        name: "first",
        email: "user@email.com",
        password_confirmation: nil
      })
      expect(@user).not_to be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      @user = User.create({
        name: "first",
        email: "user@email.com",
        password: "testing",
        password_confirmation: "testing123"
      })
      expect(@user).not_to be_valid
    end

    it 'is not valid without an email' do
      @user = User.create({
        name: "first",
        email: nil,
        password: "testing",
      })
      expect(@user).not_to be_valid
    end

    it 'is not valid without a name' do
      @user = User.create({
        name: nil,
        email: "user@email.com",
        password: "testing",
      })
      expect(@user).not_to be_valid
    end

    
    


  end

  describe '.authenticate_with_credentials' do


  end

end