module UsersHelper

  def gravatar_for(user, width)
    avatar = user.avatar_url
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=150&d=#{avatar}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar", width: width)
  end

end
