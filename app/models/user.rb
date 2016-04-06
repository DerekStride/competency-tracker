class User < ActiveRecord::Base
  has_many :user_competencies
  has_many :competencies, through: :user_competencies
  has_many :assessed, class_name: 'UserCompetency', inverse_of: :assessor

  def levels
    user_competencies.map { |uc| [uc.competency.name, uc.level] }.to_h
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
