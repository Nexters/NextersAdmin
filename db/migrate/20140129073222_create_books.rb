class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.references :member
      t.references :category
      t.has_attached_file :img
      t.timestamps
    end
  end
end
