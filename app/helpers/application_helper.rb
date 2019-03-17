module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
      p attributes
      p "X" * 30
    end

    content_tag("div", attributes, &block)
  end
end
