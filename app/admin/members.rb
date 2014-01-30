ActiveAdmin.register Member do
  #decorate_with BookDecorator
  config.sort_order = "id_desc"
  menu :priority => 4, :label=>"멤버 등록"
  index do
    selectable_column
    column :id do |member|
      link_to member.id, admin_member_path(member)
    end
    column :name
    column :role

    default_actions
  end
  show do
    attributes_table do
        row :name
        row :role
    end
    panel '가지고 있는 책들' do
      table_for member.books do
        column "Book" do |book|
          links = ''.html_safe
          links += link_to "#{book.title} - #{book.author}", admin_book_path(book)
          links
        end
      end
    end
    panel '빌린 책들' do
      table_for member.reservations do
        column "Book" do |res|
          links = ''.html_safe
          links += link_to "#{res.book.title} - #{res.book.author}", admin_reservation_path(res)
          links
        end
      end
    end
  end
end
