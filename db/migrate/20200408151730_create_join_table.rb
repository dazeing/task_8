class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :artists, :groups do |t|
      t.index [:artist_id, :group_id]
      # t.index [:group_id, :artist_id]
    end
  end
end
