module PostsHelper
  def render_post_content(post)
    simple_format(truncate(post.content, length: 20))
  end
end
