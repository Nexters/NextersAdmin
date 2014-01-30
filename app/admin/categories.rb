ActiveAdmin.register Category do
  menu :priority => 3, :label=>"카테고리 등록"
  show do
    attributes_table do
        row :name
    end
    panel '카테고리 책들' do
      table_for category.books do
        column "Book" do |book|
          links = ''.html_safe
          links += link_to "#{book.title} - #{book.author}", admin_book_path(book)
          links
        end
      end
    end
  end
end
