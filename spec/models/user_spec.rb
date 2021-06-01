require 'rails_helper'
require './app/models/user'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'does not allow duplicate emails (case insensitive)' do
      @user = User.new(name: "Bob", email: "bob@builder.com", password: "build", password_confirmation: "build")
      expect {@user.save}.to change(User, :count).by(1)
      @user2 = User.new(name: "Joe", email: "BOB@builder.com", password: "destroy", password_confirmation: "destroy")
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'does not allow a short password' do
      @user = User.new(name: "Bob", email: "bob@builder.com", password: "bui", password_confirmation: "bui")
      @user.save
      expect(@user.errors.full_messages).to include("Password must be at least 4 characters")
    end
  end

  describe '.authenticate_with_credentials' do
    it "authenticates a valid user" do

      @user = User.new(name: "Jeff", email: "jeff@thebrotherhood.com", password: "brotherhood")
      @user.save
      expect(User.authenticate_with_credentials("jeff@thebrotherhood.com", "brotherhood")).to be_truthy

    end

    it "is case insensitive" do

      @user = User.new(name: "Jeff", email: "jeff@thebrotherhood.com", password: "brotherhood")
      @user.save
      expect(User.authenticate_with_credentials("JEFF@thebrotherhood.com", "brotherhood")).to be_truthy

    end

    it "does not authenticate an invalid user" do

      @user = User.new(name: "Jeff", email: "jeff@thebrotherhood.com", password: "brotherhood")
      @user.save
      expect(User.authenticate_with_credentials("brad@thebrotherhood.com", "bradtherhood")).to be_falsy

    end
  end
end
