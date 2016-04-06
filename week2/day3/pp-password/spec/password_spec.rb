require_relative "../lib/password.rb"

RSpec.describe PasswordChecker do
  let(:check) {PasswordChecker.new}
  describe '#check_password' do
  	describe 'Test 1 - length' do
	  	it 'is longer then 7 characters true' do
	  		email = "rafa@ironhack.com"
	  		password = "123ABDCdefgh&*^@"
	  		expect(check.check_password(email,password)).to be true
	  	end
	  	it '7 characters is false' do
	  		email = "rafa@ironhack.com"
	  		password = "1234567"
	  		expect(check.check_password(email,password)).to be false
	  	end
	  	it 'less then 7 is false' do
	  		email = "rafa@ironhack.com"
	  		password = "1234"
	  		expect(check.check_password(email,password)).to be false
	  	end
  	end
  	describe 'Test 2 - 1low, 1up, 1num, 1sym' do
  	  it 'has one of each' do
  	  	email = "rafa@ironhack.com"
	  		password = "123ABDCdefgh&*^@"
	  		expect(check.check_password(email,password)).to be true
  	  end
  	  it 'fail if no number' do
  	  	email = "rafa@ironhack.com"
	  		password = "ABDCdefgh&*^@"
	  		expect(check.check_password(email,password)).to be false
  	  end
  	  it 'fail if no symbol' do
				email = "rafa@ironhack.com"
	  		password = "123ABDCdefgh"
	  		expect(check.check_password(email,password)).to be false
  	  end
  	  it 'fail if no lowercase letter' do
  	  	email = "rafa@ironhack.com"
	  		password = "123ABDC&*^@"
	  		expect(check.check_password(email,password)).to be false
  	  end
  	  it 'fail if no uppercase letter' do
  	  	email = "rafa@ironhack.com"
	  		password = "123defgh&*^@"
	  		expect(check.check_password(email,password)).to be false
  	  end
  	end
  	describe 'does not contain email name or domain name' do
  		it 'passes with no name or domain' do
	  		email = "rafa@ironhack.com"
	  		password = "123ABDCdefgh&*^@"
	  		expect(check.check_password(email,password)).to be true
  		end  
  		it 'fails with name' do
	  		email = "rafa@ironhack.com"
	  		password = "123ABDCdefgh&*^@rafa"
	  		expect(check.check_password(email,password)).to be false
  		end
  		it 'fails with domain' do
	  		email = "rafa@ironhack.com"
	  		password = "123ABDCdefgh&*^@ironhack"
	  		expect(check.check_password(email,password)).to be false
  		end
  	end
  	
  end
end