module UsersHelper

  def profile_pic(user, width = 200, height = 200)
    if user.photo_url
      cl_image_tag user.photo_url, :width => width, :height => height, :crop => :fill
    else
      image_tag '/assets/avatar_blank.jpg'
    end
  end
end
