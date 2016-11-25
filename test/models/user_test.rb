require 'test_helper'

class UserTest < ActiveSupport::TestCase

      def setup
        @user =User.new(name:"exemple user",email: "util@example.com", password: "foobar", password_confirmation: "foobar")
      end

      test "should be valid" do
        assert @user.valid?
      end

      test "should be present" do
        assert @user.name=" "
        assert_not @user.valid?
      end

      test "password should be present" do
        assert @user.password=" "
        assert_not @user.valid?
      end

      test "password_confirmation should be present" do
        assert @user.password_confirmation=" "
        assert_not @user.valid?
      end

      test "name should not be too long " do
        @user.name="a "*51
        assert_not @user.valid?
      end

      test "email should not be too long " do
        @user.email="a "*224 + "@example.com"
        assert_not @user.valid?
      end

      test "email validation should accept valid addresses" do
        valid_addresses = ["user@example.com","USER@foo.COM","A_USER@foo.bar.org","first.last@foo.jp","alice+bob@baz.cn"]
            valid_addresses.each  do |valid_address|
                @user.email = valid_address
                assert @user.valid?, "#{valid_address.inspect} should be valid"
              end
      end

      test "email validation should reject invalid addresses" do
        invalid_addresses = ["user@example,com","user_at_foo.com","user.name@example.","foot@bar_baz.com","foo@bar+baz.com"]
            invalid_addresses.each  do |invalid_address|
                @user.email = invalid_address
                assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
              end
      end

      test "email adress should be unique " do
          duplicate_user=@user.dup
          @user.save
          assert_not  duplicate_user.valid?
          end

          test "email validation should  be ok" do
            varmail = "TGzdaTaT@TGMaiL.CoM"
            @user.email=varmail
            @user.save
            assert @user.valid? #,"#{varmail} ok"," pb"
            end
=begin
assert varmail.downcase?, " bien en minuscule","bien en majsucule"
      if varmail == varmail.downcase
      "bien en minuscule"
      @user.save
      else
      " pb, contient des majuscules"
      end
=end

  # test "the truth" do
  #   assert true
  # end
end
