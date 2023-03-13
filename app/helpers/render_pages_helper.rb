module RenderPagesHelper
  def hide_navbar?
    current_page?(new_family_path)
  end
end
