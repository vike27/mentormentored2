module UsersHelper

  def show_if_allowed(user, field)
    if current_user == user
      [user[field], attribute_with_tag(user, field)].compact.join(' ').html_safe
    elsif !user.private_attrs.include?(field)
      user[field]
    else
      nil
    end
  end

  def attribute_with_tag user, field
    '<span class="label label-info">Private</span>' if user.private_attrs.include?(field)
  end

end
