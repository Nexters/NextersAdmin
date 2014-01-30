ActiveAdmin.register Book do
  decorate_with BookDecorator
  config.sort_order = "id_desc"
  scope :all, :default => true
  menu :priority => 1, :label=>"책등록"
  collection_action :import_csv, :method => :post do
    # Do some CSV importing work here...
    redirect_to admin_member_path(member)
  end
  index do
    selectable_column
    column :id do |book|
      link_to book.id, admin_book_path(book)
    end
    column "상태",:status_html
    column "타이틀",:title
    column "저자", :author
    column "이미지",:img_small_html
    column "책주인",:member
    column "카테고리",:category
    column "대여" do |book|
      if book.reservation == nil
        link_to "대여하기", new_admin_reservation_path(:book_id=>book.id), :style=>'color:#0000FF;'
      else
        link_to "반납하기", admin_reservation_path(book.reservation), :style=>'color:#FF0000;',
            :method => :delete, :data => {:confirm => "너 "+book.reservation.member.name+ "맞지 반납할래?"}
      end
    end
    default_actions
  end

  form do |f|
    f.inputs "책" do
      f.input :title, :label => '제목', :hint=>"책 제목"
      f.input :author, :label => '저자', :hint=>"누가쓴책"
      f.input :description, :label => '설명', :hint=>"책내용 간단히 알려주세요."
      f.input :img, :label => '이미지', :hint=>"이미지 있으면 올려주세요."
      f.input :member, :label => '책주인', :hint=>"당신은 누구신가요?", :prompt => 'Choose one'
      f.input :category, :label => '카테고리', :hint=>"어떤 카테고리의 책인가요?"
    end
    f.actions
  end

  show :title => "책" do
    attributes_table do
      row "타이틀" do |book|
        book.title
      end
      row "설명" do |book|
        book.description
      end
      row "저자" do |book|
        book.author
      end
      row "이미지" do |book|
        book.img_html
      end
      row "멤버" do |book|
        book.member
      end
      row "카테고리" do |book|
        book.category
      end
      row "빌린사람" do |book|
        if book.reservation != nil
          book.reservation.member
        end
      end
      row "반납" do |book|
        if book.reservation != nil
          link_to "반납하기", admin_reservation_path(book.reservation), :style=>'color:#FF0000;',
            :method => :delete, :data => {:confirm => "너 "+book.reservation.member.name+ "맞지 반납할래?"}
        else
          link_to "대여하기", new_admin_reservation_path(:book_id=>book.id), :style=>'color:#0000FF;'
        end
      end
    end

    active_admin_comments
  end
  scope :all, :default => true
  scope :borrowable do |book|
    book.includes [:reservation]
  end
  # scope :design do |book|
  #   book.where("category_id = '2'")
  # end
  #scope :not_reservation do |books|
    #book.not_reservation
    #puts book.model
    #book.where("reservation.due_date > ?",Time.now.midnight)
    #Book.joins(:reservations).where("reservations.due_date > ?",Time.now.midnight)
  #end
end
