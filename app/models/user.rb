class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.create_with_wechat(auth)
    create! do |user|
      user.provider = 'wechat'
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || auth['info']['nickname'] || ''
        user.avatar = auth['info']['headimgurl']
        user.sex = auth['info']['sex']
        user.province = auth['info']['province']
        user.city = auth['info']['city']
        user.country = auth['info']['country']
      end
    end
  end
end
