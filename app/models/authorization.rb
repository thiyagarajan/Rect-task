class Authorization < ActiveRecord::Base
  belongs_to :user

  after_create :fetch_details

  def fetch_details
    self.send("fetch_details_from_#{self.provider.downcase}")
  end

  def fetch_details_from_facebook
    graph = Koala::Facebook::API.new(self.token)
    facebook_data = graph.get_object('me')
    self.save
    #image_id = facebook_data['id'].to_s
    #self.user.facebook_avatar = 'https://graph.facebook.com/' + image_id + '/picture?type=large'
    self.user.save
  end
end
