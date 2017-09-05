require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
  	before do
  		@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")
  	end

  	it "User can be created" do
  		expect(@user).to be_valid
  	end

  	it "User cannot be created without first_name, last_name" do
  		@user.first_name = nil
  		@user.last_name = nil
  		expect(@user).to_not be_valid
  	end
  	describe "custom full name method" do
  	  it "combines first and last name" do
  	    expect(@user.full_name).to eq("SNOW, JON")
  	  end
  	end
  end
end