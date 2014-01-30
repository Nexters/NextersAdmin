class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members,:options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :name
      t.integer :role_id, :default => 0
      t.timestamps
    end
  end
end
