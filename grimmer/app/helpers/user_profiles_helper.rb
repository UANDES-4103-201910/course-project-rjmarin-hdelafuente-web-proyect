module UserProfilesHelper

  def auto_link_usernames(text)
  text.gsub /(?<=\s|^)@[A-Za-z0-9_]+(?=\b)/ do |username|
    @user_profile = UserProfile.where("username = ?" , username.gsub('@','')).first
    if @user_profile
    link_to(username, user_profile_path(@user_profile), :class => "nav-link", :style => 'width: min-content')
      end
  end.html_safe
end
end
