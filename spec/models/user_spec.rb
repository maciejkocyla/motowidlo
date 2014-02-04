require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example User", email: "example@email.com", password: "foobar", password_confirmation: "foobar") }
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }

  it { should be_valid }

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank}
  end

  describe "when name is not present" do
    before { @user.name =  " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do 
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = "a" * 26 }
    it { should_not be_valid }
  end

  describe "when email is invalid" do
    it "should not be valid" do
      addresses = %w[ user@foo,com user_at_foo.com example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |adr|
        @user.email = adr
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do 
      addresses = %w[ user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@foo.fre]
      addresses.each do |adr|
        @user.email = adr
        expect(@user).to be_valid
      end
    end
  end

  describe "when email is already taken" do
    before do 
      user_copy = @user.dup
      user_copy.email = @user.email.upcase
      user_copy.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Sample user", email: "sample.user@email", password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) {User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "no validation" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

  describe "too short password" do
    before do
      @user.password = @user.password_confirmation = "a" * 5
    end
    it { should_not be_valid }
  end

end
