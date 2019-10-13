module ApplicationHelper
  def prefix_title
    content_for :title do
      " | " if content_for? :title
    end
  end
end
