module GroupsHelper
  def render_group_title(group)
    truncate(group.title, length: 10)
  end
  def render_group_description(group)
    truncate(group.description, length: 20)
  end
end
