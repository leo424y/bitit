module GroupsHelper
  def render_group_title(group)
    truncate(group.title, length: 15)
  end
  def render_group_description(group)
    truncate(group.description, length: 25)
  end
end
