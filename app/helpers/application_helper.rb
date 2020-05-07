module ApplicationHelper

  def title
    [ @title, "J Dussault" ].compact.join(" | ")
  end

end
