require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do
  	it "can be created" do
  		expect(@user).to be_valid
  	end

  	it "cannot be created without first_name, last_name" do
  		@user.first_name = nil
  		@user.last_name = nil
  		expect(@user).to_not be_valid
  	end
  		it "cannot be created without phone" do
  		@user.phone = nil
  		expect(@user).to_not be_valid
  	end
  	
  	it 'require the phone attr to only contain integer' do
      @user.phone = 'mygreatstr'
  		expect(@user).to_not be_valid
    end
    
    it 'require the phone attr to only have 12 chars' do
    	@user.phone = '1234567891123'
  		expect(@user).to_not be_valid
    end  
    
      	it 'require the ssn attr to only contain integer' do
      @user.ssn = 'mygr'
  		expect(@user).to_not be_valid
    end
    
    it 'require the ssn attr to only have 4 chars' do
    	@user.ssn = '12345'
  		expect(@user).to_not be_valid
    end  
    
    it 'require the SSN' do
    	@user.ssn = nil
  		expect(@user).to_not be_valid
    end   
    it 'requires user to have company' do
    	@user.company = nil
  		expect(@user).to_not be_valid
    end
    
    
  
  end
  
  

  describe "custom name methods" do
    it 'has a full name method that combines first and last name' do
      expect(@user.full_name).to eq("SNOW, JON")
    end
    
    describe 'relationship between admin and employees' do
      it 'allows for admins to be assocaited with multiple employees' do
      employee_1 = FactoryGirl.create(:user)
      employee_2 = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin_user)
      Hand.create!(user_id: admin.id, hand_id: employee_1.id)
      Hand.create!(user_id: admin.id, hand_id: employee_2.id)
      expect(admin.hands.count).to eq(2)
      end
    end  
  end
end