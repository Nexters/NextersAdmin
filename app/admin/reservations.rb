ActiveAdmin.register Reservation do
  menu :priority => 2, :label=>"책 대여"
  index do
    selectable_column
    column :id do |res|
      link_to res.id, admin_reservation_path(res)
    end
    column "제목" do |res|
      res.book.title
    end
    column "빌린사람" do |res|
      res.member.name
    end
    column "반납일자" do |res|
      res.due_date
    end
    column "반납" do |res|
      link_to "반납하기", admin_reservation_path(res.book.reservation),
            :method => :delete, :data => {:confirm => "너 "+res.member.name+ "맞지 반납할래?"}
    end
  end
  show :title => "예약" do
    attributes_table do
      row "제목" do |res|
        res.book.title
      end
      row "빌린사람" do |res|
        res.member.name
      end
      row "내용" do |res|
        res.book.description
      end
      row "반납일자" do |res|
        res.due_date
      end
      row "반납" do |res|
        link_to "반납하기", admin_reservation_path(res.book.reservation),
            :method => :delete, :data => {:confirm => "너 "+res.member.name+ "맞지 반납할래?"}
      end
    end
    active_admin_comments
  end
  form do |f|
    f.inputs "예약" do
      puts params
      f.input :due_date, :as=>:date_select, :hint=>"언제까지 빌릴거야?"
      f.input :book, :hint => "빌릴 책이 먼데?", :selected => params[:book_id]
      f.input :member, :hint => "누가 빌는거야?"
    end
    f.actions
  end
end
