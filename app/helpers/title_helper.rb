module TitleHelper
  def title_tag
    content_tag :title, title_text
  end

  def title changed_to_text
    content_for :title, changed_to_text
  end

private
  def title_text
    if page_title.present?
      "#{page_title} | Bitbox"
    else
      "Bitbox"
    end
  end

  def page_title
    content_for :title
  end
end
