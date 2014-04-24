module UsersHelper
  def gravatar_for(user, options = {size: 50})
    hash = Digest::MD5.hexdigest(user.email.strip.downcase)
    size = options[:size]
    gravatar_url = "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
