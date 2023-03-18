module RenderPagesHelper
  def hide_navbar?
    current_page?(new_family_path) || current_page?(root_path) || (!user_signed_in?)
  end
end
