class CreateRide < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
    t.string :name
    t.string :drop
    t.string :pace
    t.datetime :start_time
    t.string :location
    t.float :distance
    t.text :description
    t.string :surface
    t.belongs_to :user
    end
    
  end
end
