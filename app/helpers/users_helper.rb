module UsersHelper
  def gravatar_for(user)
    hash = Digest::MD5.hexdigest(user.email.strip.downcase)
    gravatar_url = "http://www.gravatar.com/avatar/#{hash}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
