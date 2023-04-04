module RenderPagesHelper
  def hide_navbar?
    current_page?(new_family_path) || current_page?(root_path) || (!user_signed_in?)
  end

  def show_notifications?
    (user_signed_in? && current_user.family) && (current_page?(main_page_path) || current_page?(family_path(current_user.family)) || current_page?(documents_path))
  end
end
