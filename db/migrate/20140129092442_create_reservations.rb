class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :due_date
      t.references :book
      t.references :member
      t.timestamps
    end
  end
end
