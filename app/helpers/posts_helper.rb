module PostsHelper
  def render_post_content(post)
    simple_format(truncate(post.content, length: 200))
  end
end
