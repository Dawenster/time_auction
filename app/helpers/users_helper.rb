module UsersHelper

  def profile_pic(user, width = 200, height = 200)
    if user.photo_url
      cl_image_tag user.photo_url, :width => width, :height => height, :crop => :pad
    else
      image_tag '/assets/avatar_blank.jpg'
    end
  end

  def avatar(user, width = 25, height = 25)
    if user.photo_url
      link_to (cl_image_tag current_user.photo_url.gsub('large', 'square'), 
      :width => width, :height => height, 
      :gravity => :face, :crop => :thumb) + current_user.name.split(" ").first, 
      user_path(current_user), :id => "navName"
    else
      link_to (cl_image_tag 'v1365894993/avatar_blank_q1pbbs.jpg', 
      :width => width, :height => height, 
      :gravity => :face, :crop => :thumb) + current_user.name.split(" ").first, 
      user_path(current_user), :id => "navName"
    end
  end
end
