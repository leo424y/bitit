module AskwordsHelper
  def render_askword_title(askword)
    truncate(askword.title, length: 10)
  end
  def render_askword_description(askword)
    truncate(askword.description, length: 10)
  end
end
