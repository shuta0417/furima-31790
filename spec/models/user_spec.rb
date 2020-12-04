require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全て正常の時" do
        expect(@user.valid?).to eq true
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")      
      end
      it"emailが空の場合に登録ができないこと" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it"emailに@が含まれていない場合に登録ができないこと" do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが6文字以下であれば登録できない" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it"passwordが半角英語のみ"do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it"passwordが数字のみ"do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it"passwordが全角英数のみ"do
        @user.password = "AAAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー名全角必須" do
        @user.first_name ='test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end 
      it"ユーザー名全角必須"do
         @user.last_name ='test'
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it"ユーザー名全角、空では登録できない"do
         @user.first_name =""
         @user.valid?
         expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it"ユーザー名全角、空では登録できない"do
         @user.last_name =""
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "ユーザー名フリガナ必須" do
        @user.first_name_kana ='test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "ユーザー名フリガナ必須" do
        @user.last_name_kana ='test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it"ユーザー名全角(カタカナ)、空では登録できない"do
        @user.first_name =""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it"ユーザー名全角(カタカナ)、空では登録できない"do
         @user.last_name =""
         @user.valid?
         expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "生年月日必須" do
        @user.birthday ='test'
        @user.birthday =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank", "Birthday is invalid")
      end
    end
  end
end