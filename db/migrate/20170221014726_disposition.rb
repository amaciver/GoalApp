class Disposition < ActiveRecord::Migration
  def change
    create_table :user_dispositions do |t|
      t.string :dispo
      t.integer :user_id
    end
  end
end
