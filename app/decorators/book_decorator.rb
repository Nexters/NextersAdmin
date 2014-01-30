class BookDecorator < Draper::Decorator
  delegate_all
  def status_html
    if model.reservation == nil
      h.content_tag :span, "대여가능", class: "status_tag green"
    elsif model.reservation.due_date < Time.now.midnight
      h.content_tag :span, "연체중", class: "status_tag red"
    else
      h.content_tag :span, "대여중", class: "status_tag orange"
    end
  end
  def img_html
    h.image_tag img.url(:original), :style=>"width: 100px; height: 150px"
  end
  def img_small_html
    h.image_tag img.url(:original), :style=>"width: 100px; height: 100px"
  end
end
