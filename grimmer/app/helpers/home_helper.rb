module HomeHelper

  def auto_link_usernames(text)
    text.gsub /(?<=\s|^)@[A-Za-z0-9_]+(?=\b)/ do |username|
      link_to(username, user_profile_path(username.gsub('@', '')))
    end.html_safe
   end
end
