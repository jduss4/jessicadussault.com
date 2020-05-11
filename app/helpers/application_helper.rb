module ApplicationHelper

  def nav_link_class(link)
    if current_page? link
      "nav-link active"
    else
      "nav-link"
    end
  end

  def title
    [ @title, "J Dussault" ].compact.join(" | ")
  end

end
