class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_omniauth(auth, current_user)
    begin
      authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
      if authorization.user.blank?
        user = current_user.nil? ? User.where('email = ?', auth["info"]["email"]).first : current_user
        if user.blank?
          user = User.new
          user.password = 'facebook'
          # user.first_name = auth.info.first_name
          # user.last_name = auth.info.last_name
          user.email = auth.info.email
          #user.skip_confirmation!
          user.save(:validate => false)
        end
        authorization.user_id = user.id
        if Authorization.find_by_user_id(user.id).nil?
          authorization.save!
        end
      end
      authorization.user
    rescue Exception => e
      puts "caught exception #{e}! ohnoes!"
    end
  end
end
